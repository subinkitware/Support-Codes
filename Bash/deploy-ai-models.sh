#!/bin/bash
set +e

cd /home/local/KHQ/s.erattakulangara/Documents/HistomicsTK_EKS/dsa-run-custom-ai-models/aiInferenceModel

source ~/anaconda3/etc/profile.d/conda.sh

conda activate runCustomAI

python main.py

