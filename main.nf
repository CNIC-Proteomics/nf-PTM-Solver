#!/usr/bin/env nextflow
/*
========================================================================================
    PTM-compass
========================================================================================
    Github : https://github.com/CNIC-Proteomics/ptm-compass
----------------------------------------------------------------------------------------
*/

nextflow.enable.dsl = 2


/*
========================================================================================
    VALIDATE & PRINT PARAMETER SUMMARY
========================================================================================
*/

// Under construction
WorkflowMain.initialise(workflow, params, log)

/*
========================================================================================
    IMPORT LOCAL MODULES/SUBWORKFLOWS
========================================================================================
*/

include { SOLVER } from './workflows/solver'


//
// SUBWORKFLOW: Create input channels
//
include {
    CREATE_INPUT_CHANNEL_SOLVER
} from './subworkflows/create_input_channel'


/*
========================================================================================
    DEFINED WORKFLOWS
========================================================================================
*/

//
// WORKFLOW: Run main analysis pipeline
//

workflow SOLVER_WORKFLOW {
    //
    // SUBWORKFLOW: Create input channel
    //
    CREATE_INPUT_CHANNEL_SOLVER()
    //
    // WORKFLOW: Run SOLVER analysis pipeline
    //
    SOLVER(
        CREATE_INPUT_CHANNEL_SOLVER.out.ch_peakfdr_file,
        CREATE_INPUT_CHANNEL_SOLVER.out.ch_apexlist_file,
        CREATE_INPUT_CHANNEL_SOLVER.out.ch_database,
        CREATE_INPUT_CHANNEL_SOLVER.out.ch_sitelist_file,
        CREATE_INPUT_CHANNEL_SOLVER.out.ch_groupmaker_file,
        CREATE_INPUT_CHANNEL_SOLVER.out.ch_params_file
    )
}


/*
========================================================================================
    RUN ALL WORKFLOWS
========================================================================================
*/

// Info required for completion email and summary
def multiqc_report = []

//
// WORKFLOW: Execute a single named workflow for the pipeline
//
workflow {

    // Execute the PTM-Solver workflow
    SOLVER_WORKFLOW()
}

/*
========================================================================================
    COMPLETION EMAIL AND SUMMARY
========================================================================================
*/

// workflow.onComplete {
//     if (params.email || params.email_on_fail) {
//         NfcoreTemplate.email(workflow, params, summary_params, projectDir, log, multiqc_report)
//     }
//     NfcoreTemplate.summary(workflow, params, log)
//     if (params.hook_url) {
//         NfcoreTemplate.IM_notification(workflow, params, summary_params, projectDir, log)
//     }
// }

/*
========================================================================================
    THE END
========================================================================================
*/
