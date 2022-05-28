
#include <systemc>
using namespace sc_core;
using namespace sc_dt;

SC_MODULE(Stimulation) {
    sc_clock clk; // declares a clock
    sc_signal<int> cnt;

    sc_out<bool> a;
    sc_out<bool> b;
    sc_in<bool> sum;
    sc_in<bool> carry;

    SC_CTOR(Stimulation) :  clk("clk", 1, SC_SEC) 
    {
        cnt=0;
        SC_METHOD(do_stim)
        sensitive << clk;
        SC_METHOD(check_results)
        sensitive << sum << carry;
    };

    void do_stim() 
    {
        if(clk.posedge())
        {
            b= cnt & 0x1;
            a=(cnt & 0x2) == 0;
            cnt = cnt+ 1;
        }
    }

    void check_results() 
    {
        assert(sum   == ((a + b) == 1));
        assert(carry == ((a + b)  > 1));
        std::cout  << "Cnt" << cnt <<" A:" << a << " B:" << b << " Sum:" << sum << " Carry: " << carry << std::endl;
    }
};


SC_MODULE(HalfAdder){ // define a systemC module
    sc_in<bool> a;
    sc_in<bool> b;
    sc_out<bool> sum;
    sc_out<bool> carry;

    SC_CTOR(HalfAdder) {// constructor function, to be explained later
        SC_METHOD(Add) 
        sensitive << a << b ;
    }

    void Add(void) { // a function for systemC simulation kernel, void inside () can be omitted
        sum = a ^ b;
        carry = a & b;
    }
};

int sc_main(int, char*[]) { // entry point
    sc_signal<bool> a_sig, b_sig, sum_sig, carry_sig;
    HalfAdder adder("Adder"); // approach #2, instantiate a systemC module
    Stimulation stim("Stimulation"); // approach #2, instantiate a systemC module
    
    adder.a(a_sig);
    adder.b(b_sig);
    adder.carry(carry_sig);
    adder.sum(sum_sig);

    stim.a(a_sig);
    stim.b(b_sig);
    stim.carry(carry_sig);
    stim.sum(sum_sig);

    sc_trace_file* file = sc_create_vcd_trace_file("task1_trace");
    sc_trace(file, a_sig, "a");
    sc_trace(file, b_sig, "b");
    sc_trace(file, sum_sig, "sum");
    sc_trace(file, carry_sig, "carry");
    sc_start(4, SC_SEC); // let systemC simulation kernel to invoke helloworld.Add();
    sc_close_vcd_trace_file(file);

    return 0;
}