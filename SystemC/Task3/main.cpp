#include <stdio.h>
#include <stdlib.h>
#include "systemc.h"
#include "lodepng.h"

using namespace sc_core;
using namespace sc_dt;


SC_MODULE(Grayscale){
    sc_in<bool> clk;

    sc_in<sc_uint<8>> r;
    sc_in<sc_uint<8>> g;
    sc_in<sc_uint<8>> b;

    sc_out<sc_uint<8>> gray_r;
    sc_out<sc_uint<8>> gray_g;
    sc_out<sc_uint<8>> gray_b;

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
    const char* input_file = argv[1];

    std::vector<unsigned char> in_image;
    std::vector<unsigned char> out_image;
    unsigned int width, height;

    // Load the data
    unsigned error = lodepng::decode(in_image, width, height, input_file);
    if(error) 
    {
        printf("decoder error %u : %s\n", error, lodepng_error_text(error));
    }

    // convert vector to array
    unsigned char* colors = &in_image[0];
    unsigned int length = in_image.size();
    
    sc_clock clk("clk", 1, SC_US); // declares a clock
    sc_signal<sc_uint<8>> r;
    sc_signal<sc_uint<8>> g;
    sc_signal<sc_uint<8>> b;

    sc_signal<sc_uint<8>> gray_r;
    sc_signal<sc_uint<8>> gray_g;
    sc_signal<sc_uint<8>> gray_b;

    Grayscale grayscaler("Grayscaler");
    grayscaler.clk(clk);
    grayscaler.r(r);
    grayscaler.g(g);
    grayscaler.b(b);
    grayscaler.gray_r(gray_r);
    grayscaler.gray_g(gray_g);
    grayscaler.gray_b(gray_b);

    for(int i=0; i<in_image.size(); i+=4)
    {
        r.write(in_image[i]);
        g.write(in_image[i+1]);
        b.write(in_image[i+2]);
        // fourth channel is alpha which is ignored here
        sc_start(1, SC_US); // let systemC simulation kernel to invoke helloworld.Add();

        out_image.push_back(gray_r.read());
        out_image.push_back(gray_g.read());
        out_image.push_back(gray_b.read());
        // add ignored alpha value
        out_image.push_back(in_image[i+3]);
    }

    std::vector<unsigned char> png;
    lodepng::State state; //optionally customize this one
    error = lodepng::encode(png, out_image, width, height, state);
    if(error) 
    {
        printf("encode error %u : %s\n", error, lodepng_error_text(error));
    }
    else
    {
        error = lodepng::save_file(png, argv[2]);
        if(error) 
        {
            printf("save_file %u : %s\n", error, lodepng_error_text(error));
        }
    }

    return 0;
}