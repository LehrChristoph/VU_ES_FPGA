#include <stdio.h>
#include <stdlib.h>
#include "systemc.h"
#include "lodepng.h"

using namespace sc_core;
using namespace sc_dt;


SC_MODULE(FileInput)
{
    sc_in<bool> clk;
    sc_in<char*> file_name;

    sc_out<uint> pixel;
    sc_out<uint> width;
    sc_out<uint> height;
    sc_out<sc_uint<8>> r;
    sc_out<sc_uint<8>> g;
    sc_out<sc_uint<8>> b;
    sc_out<sc_uint<8>> alpha;
    sc_out<bool> last_pixel;
    sc_out<bool> data_valid;
    
    sc_in<bool> processing_finished;

    sc_signal<int> cnt;
    std::vector<unsigned char> in_image;
    SC_CTOR(FileInput) {
        cnt=0;
        //data_valid=0;
        SC_METHOD(set_output)
        sensitive << clk.pos();
        SC_METHOD(read_file)
        sensitive << file_name<< processing_finished.pos();
    }

    void set_output()
    {
        if(data_valid)
        {
            pixel = cnt;
            
            if(cnt < width*height)
            {
                r =    in_image[(cnt << 2)  ];
                g =    in_image[(cnt << 2)+1];
                b =    in_image[(cnt << 2)+2];
                alpha =in_image[(cnt << 2)+3];
            }
            if(cnt == (width*height -1))
            {
                last_pixel=1;
            }
            cnt = cnt+1;
        }
    }

    void read_file()
    {
        if(processing_finished.posedge())
        {
            data_valid = 0;
        }
        else
        {
            unsigned int width_int, height_int;
            // Load the data
            unsigned error = lodepng::decode(in_image, width_int, height_int, file_name.read());
            if(error) 
            {
                printf("decoder error %u : %s\n", error, lodepng_error_text(error));
            }
            width.write(width_int);
            height.write(height_int);
            data_valid = 1;
        }
    }
};

SC_MODULE(FileOutput)
{
    sc_in<bool> clk;
    sc_in<char*> file_name;

    sc_in<uint> pixel;
    sc_in<uint> width;
    sc_in<uint> height;

    sc_in<sc_uint<8>> r;
    sc_in<sc_uint<8>> g;
    sc_in<sc_uint<8>> b;
    sc_in<sc_uint<8>> alpha;

    sc_in<bool> last_pixel;
    sc_in<bool> data_valid;

    sc_signal<bool> reception_finished;
    sc_out<bool> processing_finished;
    std::vector<unsigned char> out_image;

    SC_CTOR(FileOutput) {
        SC_METHOD(handle_input)
        sensitive << clk.pos();
        SC_METHOD(file_write)
        sensitive << reception_finished;
    }

    void handle_input()
    {
        if(pixel < width*height && data_valid == 1)
        {
            out_image.push_back(r.read().value());
            out_image.push_back(g.read().value());
            out_image.push_back(b.read().value());
            out_image.push_back(alpha.read().value());
            
            if(last_pixel.read())
            {
                reception_finished=1;
            }
            else
            {
                reception_finished=0;
            }
        } else if (data_valid == 0)
        {
            reception_finished=0;
        }
    }

    void file_write()
    {
        if(reception_finished)
        {
            std::vector<unsigned char> png;
            lodepng::State state;
            int error = lodepng::encode(png, out_image, width.read(), height.read(), state);
            if(error) 
            {
                printf("encode error %u : %s\n", error, lodepng_error_text(error));
            }
            else
            {
                error = lodepng::save_file(png, file_name.read());
                if(error) 
                {
                    printf("save_file %u : %s\n", error, lodepng_error_text(error));
                }
            }
            processing_finished=1;
        }
        else
        {
            processing_finished=0;
        }
    }
};

SC_MODULE(Grayscale){
    sc_in<bool> clk;

    sc_in<sc_uint<8>> r;
    sc_in<sc_uint<8>> g;
    sc_in<sc_uint<8>> b;
    sc_in<sc_uint<8>> alpha;

    sc_out<sc_uint<8>> gray_r;
    sc_out<sc_uint<8>> gray_g;
    sc_out<sc_uint<8>> gray_b;
    sc_out<sc_uint<8>> gray_alpha;

    sc_in<uint> pixel_in;
    sc_out<uint> pixel_out;

    sc_in<bool> last_pixel_in;
    sc_out<bool> last_pixel_out;

    sc_in<bool> data_valid_in;
    sc_out<bool> data_valid_out;
    

    SC_CTOR(Grayscale) {
        SC_METHOD(grayify)
        sensitive << clk.pos();
    }

    // Using lightness method from:
    // https://www.johndcook.com/blog/2009/08/24/algorithms-convert-color-grayscale/
    void grayify()
    {
        sc_uint<8> min, max;
        sc_uint<9> sum;

        if(r >= g && r >= b)
        {
            max = r;
        }
        else if(g >= r && g >= b)
        {
            max = g;
        } 
        else
        {
            max = b;
        }

        if(r <= g && r <= b)
        {
            min = r;
        }
        else if(g <= r && g <= b)
        {
            min = g;
        } 
        else
        {
            min = b;
        }

        sum = min + max;
        sum >>= 1;
        gray_r = sum;
        gray_g = sum;
        gray_b = sum;
        // forward control values
        gray_alpha = alpha;
        pixel_out = pixel_in;
        last_pixel_out = last_pixel_in;
        data_valid_out = data_valid_in;
    }

};


int sc_main(int argc, char* argv[] ) { // entry point
    
     if (argc != 3)
    {
        printf("Usage: %s <in_image> <out_image>\n", argv[0]);
        printf("in_image: Image to be grayscaled \n");
        printf("out_image: storage location of the grayscaled Image\n");
        return 1;
    }

    // Read the arguments
    char* input_file = argv[1];
    char* output_file = argv[2];
    
    sc_clock clk("clk", 1, SC_US); // declares a clock
    sc_signal<sc_uint<8>> r;
    sc_signal<sc_uint<8>> g;
    sc_signal<sc_uint<8>> b;
    sc_signal<sc_uint<8>> alpha;

    sc_signal<sc_uint<8>> gray_r;
    sc_signal<sc_uint<8>> gray_g;
    sc_signal<sc_uint<8>> gray_b;
    sc_signal<sc_uint<8>> gray_alpha;

    sc_signal<char*> file_in;
    sc_signal<char*> file_out;

    sc_signal<uint> pixel_fin;
    sc_signal<uint> pixel_fout;
    sc_signal<uint> width;
    sc_signal<uint> height;

    sc_signal<bool> last_pixel_in;
    sc_signal<bool> last_pixel_out;

    sc_signal<bool> data_valid_in;
    sc_signal<bool> data_valid_out;

    sc_signal<bool> processing_finished;

    FileInput fin("FileInput");
    fin.clk(clk);
    fin.file_name(file_in);
    fin.pixel(pixel_fin);
    fin.width(width);
    fin.height(height);

    fin.r(r);
    fin.g(g);
    fin.b(b);
    fin.alpha(alpha);
    fin.last_pixel(last_pixel_in);
    fin.data_valid(data_valid_in);
    fin.processing_finished(processing_finished);

    Grayscale grayscaler("Grayscaler");
    grayscaler.clk(clk);
    grayscaler.r(r);
    grayscaler.g(g);
    grayscaler.b(b);
    grayscaler.alpha(alpha);

    grayscaler.gray_r(gray_r);
    grayscaler.gray_g(gray_g);
    grayscaler.gray_b(gray_b);
    grayscaler.gray_alpha(gray_alpha);
    
    grayscaler.pixel_in(pixel_fin);
    grayscaler.pixel_out(pixel_fout);
    
    grayscaler.last_pixel_in(last_pixel_in);
    grayscaler.last_pixel_out(last_pixel_out);

    grayscaler.data_valid_in(data_valid_in);
    grayscaler.data_valid_out(data_valid_out);

    FileOutput fout("FileOutput");
    fout.clk(clk);
    fout.file_name(file_out);
    fout.pixel(pixel_fout);
    fout.width(width);
    fout.height(height);

    fout.r(gray_r);
    fout.g(gray_g);
    fout.b(gray_b);
    fout.alpha(gray_alpha);

    fout.last_pixel(last_pixel_out);
    fout.data_valid(data_valid_out);
    fout.processing_finished(processing_finished);

    file_in.write(input_file);
    file_out.write(output_file);

    sc_trace_file* file = sc_create_vcd_trace_file("task4_trace");
    sc_trace(file, clk, "clk");
    sc_trace(file, r, "r");
    sc_trace(file, g, "g");
    sc_trace(file, b, "b");
    sc_trace(file, alpha, "alpha");

    sc_trace(file, gray_r, "gray_r");
    sc_trace(file, gray_g, "gray_g");
    sc_trace(file, gray_b, "gray_b");
    sc_trace(file, gray_alpha, "gray_alpha");

    sc_trace(file,pixel_fin, "pixel_fin");
    sc_trace(file,pixel_fout, "pixel_fout");
    
    sc_trace(file,last_pixel_in, "last_pixel_in");
    sc_trace(file,last_pixel_out, "last_pixel_out");

    sc_trace(file,data_valid_in, "data_valid_in");
    sc_trace(file,data_valid_out, "data_valid_out");
    sc_trace(file,processing_finished, "processing_finished");

    printf("Starting transformation\n");
    // initialise transformation
    sc_start(1, SC_US); /* code */
    
    while (processing_finished.read() == 0)
    {
        sc_start(1, SC_US); /* code */
    }
    // add some slack at the end to get all transitions
    sc_start(5, SC_US);
    printf("Finished transformation\n");

    sc_close_vcd_trace_file(file);
    
    return 0;
}