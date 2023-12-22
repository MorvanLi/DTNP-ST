# Multi-focus image fusion based on dynamic threshold neural P systems and surfacelet transform

## Abstract

Dynamic threshold neural P systems (DTNP systems) are recently proposed distributed and parallel computing models, inspired from the intersecting cortical model. DTNP systems differ from spiking neural P systems (SNP systems) due to the introduction of dynamic threshold mechanism of neurons. DTNP systems have been theoretically proven to be Turing universal computing devices. This paper discusses how to apply DTNP systems to deal with the fusion of multi-focus images, and proposes a novel image fusion method based on DTNP systems in surfacelet domain. Based on four DTNP systems with local topology, a multi-focus image fusion framework in surfacelet domain is developed, where DTNP systems are applied to control the fusion of low- and high-frequency coefficients in surfacelet domain. The proposed fusion method is evaluated on an open dataset of 20 multi-focus images in terms of five fusion quality metrics, and compared with 10 state-of-the-art fusion methods. Quantitative and qualitative experimental results demonstrate the advantages of the proposed fusion method in terms of visual quality, fusion performance and computational efficiency.



## How to run?

Run the mainScript.m file to get the fused image. (I've fixed some of the code to produce color and grayscale images directly)



## Attention

Before you run this code, make sure you have surfacelet installed. I've put the necessary compiled files under the fftw-3.3.5-dll64 folder for direct use.

