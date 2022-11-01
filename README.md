# Compressed M-SIDH 

This repository is a [SageMath](https://www.sagemath.org/) implementation of compressed M-SIDH.

The current version of the compressed M-SIDH  implementation utilizies the techniques in the paper. The code named `Compressed_MSIDH_3DLP.sage` and `Compressed_MSIDH_4DLP.sage` applied the methods in Sections 4.3 and 4.4 to compute discrete logarithms, respectively. Our implementation also use the traditional and [velusqrt formulae](https://velusqrt.isogeny.org/) on Montgomery curve x-only projective coordinates.

## Run the code

To test compressed M-SIDH with three discrete logarithm computations, run

```sh
$ sage Compressed_MSIDH_3DLP.sage
```

To test compressed M-SIDH with three discrete logarithm computations, run
```sh
$ sage Compressed_MSIDH_4DLP.sage
```
