#!/usr/bin/env bash

# Acknowledgements: Most of the codes are based on the codes provided by https://github.com/jefferyYu

for i in 'amazon'
do
    echo ${i}
    for k in 'MBert'
    do
        echo ${k}
        for j in 'first' 'cls' 'both' # 'first' 'cls' 'both'
        do
            echo ${j}
            PYTHONIOENCODING=utf-8 python run_multimodal_classifier.py --data_dir \
            ./data/${i} --task_name ${i} --output_dir ./output/${i}_${k}_${j}_mm_output/ \
            --bert_model bert-base-uncased --do_train --do_eval --train_batch_size 32 --mm_model ${k} --pooling ${j}  --path_image ./data/amazon_images --crop_size 80
        done
    done
    for k in 'ResBert' 'MBertNoPooling' # NoPooling
    do
        echo ${k}
        PYTHONIOENCODING=utf-8 python run_multimodal_classifier.py --data_dir \
        ./data/${i} --task_name ${i} --output_dir ./output/${i}_${k}_mm_output/ \
        --bert_model bert-base-uncased --do_train --do_eval --train_batch_size 32 --mm_model ${k} --path_image ./data/amazon_images --crop_size 80
    done
done

# save environment and shut down
export $(cat /proc/1/environ |tr '\0' '\n' | grep MATCLOUD_CANCELTOKEN)&&/public/script/matncli node cancel -url https://matpool.com/api/public/node -save -name amazon4.0