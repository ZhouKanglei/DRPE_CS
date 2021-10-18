# Secure image encryption scheme using double random-phase encoding and compressed sensing

A secure optical digital image encryption scheme with authentication capability is proposed using double random-phase encoding (DRPE) and compressed sensing (CS). Phase information of the plaintext image is obtained using DRPE and quantized to generate authentication information. Simultaneously, the plaintext image is compressed by CS and its measurements are quantized using the sigmoid map. Then the ciphertext image is obtained by permutation and diffusion after authentication information is embedded in quantified measurements. At receiving end, the authentication information is first extracted by inverse permutation and diffusion, and then the authentication image is obtained by inverse DRPE. Finally, the ciphertext image can be blindly authenticated using a nonlinear cross-correlation method with authentication image and reconstructed image. Experimental results demonstrate the effectiveness of our proposed scheme.

[Paper Address](https://www.sciencedirect.com/science/article/pii/S0030399219309648) | [Download Paper](https://sci-hub.se/https://www.sciencedirect.com/science/article/pii/S0030399219309648)

![](https://ars.els-cdn.com/content/image/1-s2.0-S0030399219309648-gr1.jpg)



# Usage

1. Encryption and decryption processes

   - Configure the config file `init.m`
     - Set the hyper-parameters
     - Load keys

   - Run `test.m` to encode and decode the input image
     - Read the input image `I = imread('images/Lena_512.bmp'); `
     - Obtain the encrypted image `C`
     - Attack the the encrypted image to obtain `C_attack`
     - Decode the image to obtain the recovered image `X`
     - Authenticate correlation `[CC, PCE] = cross_relation(phase_de, X);`

2. Recover the image for CS

   - OMP
   - CVX
     - Set up the CVX toolbox first
     - See a [quick start](http://cvxr.com/cvx/doc/quickstart.html)

3. Attack

   - Run `main.m` to attack the encrypted image

     ```matlab
     posibility = 0; % Ratio of tamper
     g = 0;       	% Ratio of noisy param
     rate_crop = 0; 	% Ratio of cropping
     ```

   - Save the results

     ```matlab
     ans_name = ['ans/omp_sampling_', num2str(p), '_noise_', num2str(g),'_tamper_', num2str(posibility),'.mat'];
     save(ans_name);
     ```

4. Visualization

   - Load saved data from `ans`

     ```matlab
     load(['ans/omp_sampling_', num2str(p), '_noise_', num2str(g),'_tamper_', num2str(posibility),'.mat']);
     ```

   - Visualize the correlation plane and others

5. Evaluation

   - NPCR & UACI: `NPCR_UACI.m`
   - Correlation: `horizon_corr.m`
   - ...

# Citation

- bibtex

```tex
@article{zhou2020secure,
  title={Secure image encryption scheme using double random-phase encoding and compressed sensing},
  author={Zhou, Kanglei and Fan, Jingjing and Fan, Haiju and Li, Ming},
  journal={Optics \& Laser Technology},
  volume={121},
  pages={105769},
  year={2020},
  publisher={Elsevier}
}
```

- GB/T 7714
  - Zhou K, Fan J, Fan H, et al. Secure image encryption scheme using double random-phase encoding and compressed sensing[J]. Optics & Laser Technology, 2020, 121: 105769.

