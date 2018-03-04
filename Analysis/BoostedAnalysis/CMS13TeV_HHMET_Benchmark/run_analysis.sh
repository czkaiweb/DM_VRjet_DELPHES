#! /bin/sh
cmd='delphes_CMS13TeV_HHMET_Benchmark.C("'$1'")'
root -l -q -b $cmd
