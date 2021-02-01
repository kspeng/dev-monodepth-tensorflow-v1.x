#!/bin/bash
encoder_='vggASPP'
decoder_='unet'
decoder_up_type_='vgg'
batch_=8
epoch_=100
dataset_='kitti'
ckpt_=110000 # 362500

model_name="$(printf '%s_%s_%s_%s_%dx%d' ${dataset_%} ${encoder_%} ${decoder_%} ${decoder_up_type_%} ${batch_%} ${epoch_%})"
echo ">>> ${model_name}"

singularity run --nv ~/workspace/envImg/tfcvpy36tf15.img \
tfcv_main.py --mode train \
--data_path "$(printf '../../dataset/%s/data/' ${dataset_%})" \
--filenames_file "$(printf './data/filenames/%s_train_files.txt' ${dataset_%})" \
--log_directory models/ \
--model_name ${model_name} \
--dataset ${dataset_} \
--encoder ${encoder_} \
--decoder ${decoder_} \
--decoder_up_type ${decoder_up_type_} \
--batch_size ${batch_} \
--num_epochs ${epoch_}
#--checkpoint_path $(printf 'models/%s/model-%d' ${model_name%} ${ckpt_%}) #\
#--do_reg \
#--retrain 

