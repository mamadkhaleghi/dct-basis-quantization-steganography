# Image Processing Techniques

## Overview
This repository contains implementations of various image processing techniques in MATLAB. The project covers exercises on Discrete Cosine Transform (DCT) basis functions, image quantization, and steganography for secret image embedding and extraction.

## Features
- **Discrete Cosine Transform (DCT) Basis Functions (Q1)**
  - Computes DCT basis functions for given block sizes.
  - Visualizes the DCT basis images.
  - Implemented in `DCT_Basis.m`.

- **Image Quantization (Q2)**
  - Performs quantization on images to reduce entropy.
  - Evaluates the performance using metrics like PSNR and entropy.
  - Implemented in `Quantization.m` and executed with `q2_executor.m`.

- **Steganography (Q3)**
  - Embeds a secret image into a cover image using LSB flipping.
  - Extracts the secret image from the stego image.
  - Evaluates the performance using PSNR.
  - Implemented in `embed_secret.m` and `extract_secret.m` and executed with `q3_executor.m`.

## Dataset
- **`Images` Directory**: Contains various images used for testing the quantization and steganography algorithms.

## Files
- **Q1 Files**
  - `DCT_Basis.m`: MATLAB script to compute and visualize DCT basis functions.
  - `Alpha.m`: Helper function for computing DCT basis functions.

- **Q2 Files**
  - `Quantization.m`: MATLAB script to perform image quantization.
  - `My_Entropy.m`: Function to calculate entropy.
  - `My_MSE.m`: Function to calculate Mean Squared Error (MSE).
  - `My_PSNR.m`: Function to calculate Peak Signal-to-Noise Ratio (PSNR).
  - `rlc.m`: Run-Length Coding (RLC) function.
  - `q2_executor.m`: Script to execute and evaluate the quantization process.

- **Q3 Files**
  - `embed_secret.m`: MATLAB script to embed a secret image into a cover image.
  - `extract_secret.m`: MATLAB script to extract the secret image from the stego image.
  - `q3_executor.m`: Script to execute the embedding and extraction process.
  - `Cover_Image.png`: Example cover image.
  - `IUT.jpg`: Example secret image.

## Prerequisites
Before you begin, ensure you have MATLAB installed on your machine.

## Installation
Clone this repository to your local machine using:
```bash
git clone https://github.com/mamadkhaleghi/dct-basis-quantization-steganography.git
