# Introduction
This is a repository for SDSC8007 course project by Team 15.

Project Name: Multimodal Sentiment Classification in Amazon Review with mBERT Model


# Requirement

        PyTorch 1.11.0+cu113
        Python 3.9.7


# Download images data and ResNet-152
- Step 1: Download the amazon review associated images: [amazon_images.zip](https://drive.google.com/file/d/1WKHXG5L38ip3LddqgRaLi8zmk0cZp6nz/view?usp=sharing) (Google Drive)
- Step 2: Unzip `amazon_images.zip` to `./data/`. Make sure all images are under `./data/amazon_images/`
- Step 3: Download the pre-trained [ResNet-152](https://download.pytorch.org/models/resnet152-b121ed2d.pth) (.pth file)
- Setp 4: Move the pre-trained ResNet-152 model to `./resnet/`

# Code Usage

## (Optional) Preprocessing
- This is optional, because the data is already pre-processed in `./absa_data/` as an example.

```sh
python process_absa_data.py
```

## Run the model
- This is the training code of tuning parameters on the dev set, and testing on the test set. Note that you can change "CUDA_VISIBLE_DEVICES=1" based on your available GPUs.
- Implemented models include **ResBert** and **MBert**.

```sh
sh run_multimodal_classifier.sh
```


# Acknowledgements

Coding based on [huggingface](https://github.com/huggingface/transformers) and [jefferyYu](https://github.com/jefferyYu).
