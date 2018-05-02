#!/usr/bin/bash -eu

#SBATCH --account=gbsc
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=10M
#SBATCH -J clean_dx_projects
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=nathankw@stanford.edu
#SBATCH --output=/srv/gsfs0/projects/gbsc/workspace/nathankw/sbatch_jobs/Log_DxCleanApps/dx_clean_projects.txt
#SBATCH --open-mode=append
#SBATCH --requeue
#SBATCH --time=10

module load gbsc/scgpm_seqresults_dnanexus

scgpm_clean_raw_data.py -o org-snyder_encode -d 2
scgpm_clean_raw_data.py -o org-cescg -d 2

sbatch --begin=noon $0
