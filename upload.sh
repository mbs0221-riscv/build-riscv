#!/bin/bash

target=ubuntu@10.0.0.2:/home/ubuntu/
scp $BENCHMARK/riscv-coremark/coremark.riscv $target
scp $BENCHMARK/mibench/mibench.tar.gz $target

