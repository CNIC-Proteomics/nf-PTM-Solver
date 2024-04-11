# nf-PTM-Solver
Nextflow pipeline for the PTM-Solver workflow


# Usage

Executing using Ubuntu and Singularity (WSL - backend):
```
cd /home/jmrodriguezc/nf-PTM-Solver

nextflow \
    -log "/tmp/nextflow/log/nf-ptm-solver.log" \
    run main.nf   \
        -profile singularity \
        -params-file "/mnt/tierra/U_Proteomica/UNIDAD/DatosCrudos/jmrodriguezc/projects/nf-PTM-Solver/tests/test1/inputs/inputs.yml" \
        --outdir  "/mnt/tierra/U_Proteomica/UNIDAD/DatosCrudos/jmrodriguezc/projects/nf-PTM-Solver/tests/test1" \
        --params_file "/mnt/tierra/U_Proteomica/UNIDAD/DatosCrudos/jmrodriguezc/projects/nf-PTM-Solver/tests/test1/inputs/params.ini" \
        -resume
```


In Production using the Web Server

