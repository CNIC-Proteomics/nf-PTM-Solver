# nf-PTM-Solver
Nextflow pipeline for the PTM-Solver workflow


# Usage

Debugging using Ubuntu (Docker - backend):
```
cd /usr/local/nf-PTM-Solver

nextflow \
    -log "/opt/nextflow/nextflow/log/nf-ptm-solver.log" \
    run main.nf   \
        -params-file "/mnt/tierra/nf-PTM-Solver/tests/test1/inputs/inputs.yml" \
        --outdir  "/mnt/tierra/nf-PTM-Solver/tests/test1" \
        --params_file "/mnt/tierra/nf-PTM-Solver/tests/test1/inputs/params.ini" \
        -resume
```

In Production using the Web Server

