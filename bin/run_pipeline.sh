#!/bin/bash

function run_pipeline(){


echo ""
echo "Running Prefactor Parset"
#python ${JOBDIR}/GRID_PiCaS_Launcher/update_token_status.py ${PICAS_DB} ${PICAS_USR} ${PICAS_USR_PWD} ${TOKEN} 'running pipeline'
#python ${JOBDIR}/GRID_PiCaS_Launcher/update_token_progress.py ${PICAS_DB} ${PICAS_USR} ${PICAS_USR_PWD} ${TOKEN} output ${PARSET} &


export PYTHONPATH=${RUNDIR}/ddf-pipeline/utils/:$PYTHONPATH
export PATH=${RUNDIR}/ddf-pipeline/utils/:$PATH

export PYTHONPATH=${RUNDIR}/ddf-pipeline/scripts/:$PYTHONPATH
export PATH=${RUNDIR}/ddf-pipeline/scripts/:$PATH



./ddf-pipeline/scripts/make_mslists.py
python ddf-pipeline/scripts/pipeline.py ${PARSET} &> output

cat *mslist* >>log
cat output




echo "Output file:"
wc output
#python ${JOBDIR}/GRID_PiCaS_Launcher/update_token_status.py ${PICAS_DB} ${PICAS_USR} ${PICAS_USR_PWD} ${TOKEN} 'processing_finished'

}
