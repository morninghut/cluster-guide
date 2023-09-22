#!/bin/bash
#SBATCH -o job.%j.out
#SBATCH --partition=gpu-rtx3080ti
#SBATCH --qos=normal
#SBATCH -J NO-N
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-core=1
#SBATCH --gpus=1
python test.py
sleep 15