#include <stdio.h>
#include <stdlib.h>
#include "systemc.h"

using namespace sc_core;
using namespace sc_dt;

#ifndef BITWIDTH
    #define BITWIDTH 8
#endif


SC_MODULE(HalfAdder){
    sc_in<bool> a;
    sc_in<bool> b;
    sc_out<bool> sum;
    sc_out<bool> carry;

    SC_CTOR(HalfAdder) {
        SC_METHOD(Add) 
        sensitive << a << b ;
    }

    void Add(void) {
        sum = a ^ b;
        carry = a & b;
    }
};

SC_MODULE(FullAdder){
    sc_in<bool> a;
    sc_in<bool> b;
    sc_in<bool> carry_in;
    sc_out<bool> sum;
    sc_out<bool> carry_out;

    sc_signal<bool> sum_int;
    sc_signal<bool> carry_int;
    sc_signal<bool> carry_over;

    HalfAdder input_adder;
    HalfAdder carry_adder;

    SC_CTOR(FullAdder) :
        input_adder("input_adder"),
        carry_adder("carry_adder")
    {
        // add inputs to each other
        input_adder.a(a);
        input_adder.b(b);
        input_adder.sum(sum_int);
        input_adder.carry(carry_int);

        // add sum and carry 
        carry_adder.b(carry_in);
        carry_adder.a(sum_int);
        carry_adder.sum(sum);
        carry_adder.carry(carry_over);
        // if either the carry signal is high, the carry out is high
        SC_METHOD(Or)
        sensitive << carry_over << carry_int ;
    }

    void Or(void) {
        carry_out = carry_over | carry_int;
    }
};


SC_MODULE(N_Bit_Adder){
    HalfAdder adder0;
    sc_vector<FullAdder> adders;

    sc_in<bool> clk;
    sc_in<sc_uint<BITWIDTH>> a;
    sc_in<sc_uint<BITWIDTH>> b;
    sc_out<sc_uint<BITWIDTH>> sum;
    sc_out<bool> carry;

    sc_signal<bool> a_vect[BITWIDTH];
    sc_signal<bool> b_vect[BITWIDTH];
    sc_signal<bool> sum_vect[BITWIDTH];

    sc_signal<bool> carry_int[BITWIDTH];

    SC_CTOR(N_Bit_Adder) : 
        adders("Adders", BITWIDTH-1), 
        adder0("Adder0")
    {
        adder0.a(a_vect[0]);
        adder0.b(b_vect[0]);
        adder0.sum(sum_vect[0]);
        adder0.carry(carry_int[0]);

        for(int i=0; i< BITWIDTH-1; i++)
        {
            adders[i].a(a_vect[i+1]);
            adders[i].b(b_vect[i+1]);
            adders[i].carry_in(carry_int[i]);
            adders[i].sum(sum_vect[i+1]);
            adders[i].carry_out(carry_int[i+1]);
        }

        SC_METHOD(handle_inputs)
        sensitive << clk.pos();

        SC_METHOD(handle_outputs)
        sensitive << carry_int[BITWIDTH-1];
        for(int i=0; i<BITWIDTH; i++)
        {
            sensitive << sum_vect[i];
        }
        
    }


    // converter input from integer to bool vector
    void handle_inputs()
    {
        sc_uint<BITWIDTH> a_temp = a.read();
        sc_uint<BITWIDTH> b_temp = b.read();
        for(int i=0; i<BITWIDTH; i++)
        {
            a_vect[i] = (a_temp & (1 << i)) > 0;
            b_vect[i] = (b_temp & (1 << i)) > 0;
        }
        
    }

    // converter output to integer
    void handle_outputs()
    {
        sc_uint<BITWIDTH> tmp_sum=0;
        for(int i=0; i<BITWIDTH; i++)
        {
            tmp_sum |= (sum_vect[i] << i);
        }
        sum.write(tmp_sum);
        carry.write(carry_int[BITWIDTH-1]);
    }
};

SC_MODULE(Stimulation) {
    sc_in<bool> clk;
    sc_signal<int> cnt;

    sc_out<sc_uint<BITWIDTH>> a;
    sc_out<sc_uint<BITWIDTH>> b;
    sc_in<sc_uint<BITWIDTH>> sum;
    sc_in<bool> carry;

    SC_CTOR(Stimulation) 
    {
        cnt=0;
        SC_METHOD(do_stim)
        sensitive << clk.neg();
        SC_METHOD(check_results)
        sensitive << clk.neg();
    };

    void do_stim() 
    {
        cnt = rand() & ((1 << (2*BITWIDTH)) -1);
        b =               cnt & ((1 << BITWIDTH)-1);
        a = (cnt >> BITWIDTH) & ((1 << BITWIDTH)-1);
        
    }

    void check_results() 
    {
        sc_uint<BITWIDTH+1> test_sum = a.read()+b.read();
        bool test_carry = (test_sum & (1 << BITWIDTH)) > 0;
        test_sum &= (1 << BITWIDTH) -1 ;

        assert(test_sum == sum);
        assert(test_carry == carry);

        std::cout  <<" A:" << a << " B:" << b << " Sum:" << sum << " Carry: " << carry << std::endl;
    }
};

int sc_main(int, char*[]) { // entry point
    sc_clock clk("clk", 1, SC_SEC); // declares a clock

    sc_signal<sc_uint<BITWIDTH>> a_sig;
    sc_signal<sc_uint<BITWIDTH>> b_sig;
    sc_signal<sc_uint<BITWIDTH>> sum_sig;
    sc_signal<bool> carry_sig;

    N_Bit_Adder adder("Adder"); 
    Stimulation stim("Stimulation"); 
    
    adder.a(a_sig);
    adder.b(b_sig);
    adder.sum(sum_sig);
    adder.carry(carry_sig);
    adder.clk(clk);

    stim.a(a_sig);
    stim.b(b_sig);
    stim.sum(sum_sig);
    stim.carry(carry_sig);
    stim.clk(clk);
    
    sc_trace_file* file = sc_create_vcd_trace_file("task2_trace");
    sc_trace(file, clk, "clk");
    sc_trace(file, a_sig, "a");
    sc_trace(file, b_sig, "b");
    sc_trace(file, sum_sig, "sum");
    sc_trace(file, carry_sig, "carry");
    sc_trace(file, adder.a, "Adder.a");
    sc_trace(file, adder.b, "Adder.b");
    sc_trace(file, adder.sum, "Adder.sum");
    sc_trace(file, adder.carry, "Adder.carry");

    sc_trace(file, adder.adder0.a,     "Adder.Adder0.a");
    sc_trace(file, adder.adder0.b,     "Adder.Adder0.b");
    sc_trace(file, adder.adder0.sum,   "Adder.Adder0.sum");
    sc_trace(file, adder.adder0.carry, "Adder.Adder0.carry");

    for(int i=0; i< BITWIDTH-1; i++)
    {
        sc_trace(file, adder.adders[i].a,         "Adder.Adder" + std::to_string(i+1) +".a");
        sc_trace(file, adder.adders[i].b,         "Adder.Adder" + std::to_string(i+1) +".b");
        sc_trace(file, adder.adders[i].carry_in,  "Adder.Adder" + std::to_string(i+1) +".carry_in");
        sc_trace(file, adder.adders[i].sum,       "Adder.Adder" + std::to_string(i+1) +".sum");
        sc_trace(file, adder.adders[i].carry_out, "Adder.Adder" + std::to_string(i+1) +".carry_out");
    }

    sc_start(17, SC_SEC); // let systemC simulation kernel to invoke helloworld.Add();
    sc_close_vcd_trace_file(file);
    
    return 0;
}