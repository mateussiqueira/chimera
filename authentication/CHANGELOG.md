## 2.0.0

> Note: This release has breaking changes.

 - **REFACTOR**(generic_exception): add DomainError. ([fb0cf27d](https://github.com/qcx/chimera/commit/fb0cf27d1dbacfa6221864d901d15f094d176b32))
 - **REFACTOR**(connection): refactor exceptions. ([d7d571ee](https://github.com/qcx/chimera/commit/d7d571ee16b8398412f9332b718e906e4f6181ee))
 - **REFACTOR**(authentication): remove non auth module dependencies. ([18ee4f0b](https://github.com/qcx/chimera/commit/18ee4f0b897ce7993c8e70587533c4e59ee24684))
 - **REFACTOR**(authentication): remove UnexpectedError's. ([eb9787d5](https://github.com/qcx/chimera/commit/eb9787d5a2e3bc7457d332eb4909bd8f4ad2be51))
 - **REFACTOR**(authentication): use event bus insted of nav. ([40839e0a](https://github.com/qcx/chimera/commit/40839e0ac8f37698b1f27cc7587b653491d0a5ca))
 - **REFACTOR**(internationalization): add internationalization package. ([ef2648f2](https://github.com/qcx/chimera/commit/ef2648f27c9aba3dc136ac5b5ed6fec3e235bf7c))
 - **REFACTOR**(core): add transitions to routes. ([cf571cb2](https://github.com/qcx/chimera/commit/cf571cb2d7149eb4c3da3d9c1f7510c3d38c6331))
 - **FIX**: fix certificate page. ([19d340f7](https://github.com/qcx/chimera/commit/19d340f77c5998eee063c9817399c09b1795260e))
 - **FIX**: fix login event bus. ([6ff69bc2](https://github.com/qcx/chimera/commit/6ff69bc2076e8a5f8c272eb05b660d5faf15e72e))
 - **FIX**: remove errors. ([57bcce75](https://github.com/qcx/chimera/commit/57bcce75a2c5ede63abfe37de80dd07501cada83))
 - **FIX**: fix login background image. ([acd48ef5](https://github.com/qcx/chimera/commit/acd48ef53c77f32b1cbf568083cdff61889541e3))
 - **FIX**(design_system): fix param name. ([b3518a5c](https://github.com/qcx/chimera/commit/b3518a5c8ce301e1321d1571fada6449effda17d))
 - **FIX**(authentication): remove token when can not refresh token. ([96e7a7f4](https://github.com/qcx/chimera/commit/96e7a7f4fda61cb8a2f67e5869dba3cfc2b208e9))
 - **FIX**(authentication): fix authentication page spacer. ([9897a3f4](https://github.com/qcx/chimera/commit/9897a3f4c845328d224ff871d18ac9ec5e5a4772))
 - **FIX**: remove warnings. ([3ec5e39d](https://github.com/qcx/chimera/commit/3ec5e39d4ed826aa144013e11ce481da7728c753))
 - **FIX**(authentication): fix init user merge issues. ([ca6f3ad2](https://github.com/qcx/chimera/commit/ca6f3ad2399eb6d9a62a313cec0b93f4ec968314))
 - **FIX**(authentication): fix usecases exceptions. ([9ad66086](https://github.com/qcx/chimera/commit/9ad66086d45328ded8f8e04d6fdb988152ea4628))
 - **FIX**(authentication): fix dependencies ref. ([b015b570](https://github.com/qcx/chimera/commit/b015b5700b65039147949fb4464868e4e502bbda))
 - **FEAT**(authentication): enable google auth. ([df29fc38](https://github.com/qcx/chimera/commit/df29fc382d4fd85206486ef81799e6cc5676f8bc))
 - **FEAT**(authentication): add submit field next focus. ([3a98e144](https://github.com/qcx/chimera/commit/3a98e1445d981230007e187dda79528693a41ec1))
 - **FEAT**: save user locally. ([042d3d5e](https://github.com/qcx/chimera/commit/042d3d5e23f9a2ddb1558bcf069f1e92e35c5636))
 - **FEAT**(discovery): add recent searches. ([83a45be5](https://github.com/qcx/chimera/commit/83a45be53c68c13f5dd11e78255c02292ad69eb7))
 - **FEAT**(authentication): add submit field next focus. ([fc1837f5](https://github.com/qcx/chimera/commit/fc1837f59fb352655ddb6fa0350a167870c2103e))
 - **FEAT**(connection): add dio implementation. ([2b022599](https://github.com/qcx/chimera/commit/2b022599e57b17ad065e800cd8b02c0e9869c3a8))
 - **FEAT**(discovery): init discovery module. ([6658a3c6](https://github.com/qcx/chimera/commit/6658a3c6b46debbe9a8245d7349eb907c4029763))
 - **FEAT**(learning): add no internet page in enrollments. ([1ab1b932](https://github.com/qcx/chimera/commit/1ab1b93279ba6e4ac50bd05b35c638d1788696ae))
 - **FEAT**(learning): add my enrollments call. ([8036cf73](https://github.com/qcx/chimera/commit/8036cf731522c989ae36b982158288c5c0c47e19))
 - **FEAT**(authentication): expose UserIsLoggedIn use case. ([9c48dc85](https://github.com/qcx/chimera/commit/9c48dc8592f92896ecb786dcc26b4449c24fb9ce))
 - **FEAT**(learning): prepare to link frontend into app. ([88718614](https://github.com/qcx/chimera/commit/88718614408d2123349f4a5001776683f06d407d))
 - **FEAT**(connection): add http refresh adapter. ([57f2554a](https://github.com/qcx/chimera/commit/57f2554a3c8226b660af4e6873882e10491f8b00))
 - **FEAT**(authentication): add google & apple login. ([e158f8e6](https://github.com/qcx/chimera/commit/e158f8e6402932f4bde32e55d0f27109c0387770))
 - **FEAT**(profile): add module. ([467a308f](https://github.com/qcx/chimera/commit/467a308fd4fe6086f721498e2f5fb44320dd7243))
 - **DOCS**: add authentication README.md. ([fd345c26](https://github.com/qcx/chimera/commit/fd345c262c8bc1d6af7e3552939ef24936df95ee))
 - **BREAKING** **CHANGE**: back all versions to 0.0.1. ([426c174a](https://github.com/qcx/chimera/commit/426c174ae5ecf465b1e53d5fa3278fc3948c4c74))

## 1.0.5

 - Update a dependency to the latest release.

## 1.0.4

 - Update a dependency to the latest release.

## 1.0.3

 - Update a dependency to the latest release.

## 1.0.2

 - Update a dependency to the latest release.

## 1.0.1

 - Update a dependency to the latest release.

## 0.1.0

> Note: This release has breaking changes.

 - **REFACTOR**: refactor exceptions.
 - **FIX**: fix dependencies ref.
 - **FIX**: remove warnings.
 - **BREAKING** **CHANGE**: back all versions to 0.0.1.

## 0.0.1+6

 - **FIX**: fix dependencies ref.

## 0.0.1+5

 - **REFACTOR**: refactor exceptions.
 - **FIX**: remove warnings.

## 0.0.1+4

 - Update a dependency to the latest release.

## 0.0.1+3

 - **REFACTOR**: refactor exceptions.
 - **FIX**: remove warnings.

## 0.0.1+2

 - **REFACTOR**: refactor exceptions.
 - **FIX**: remove warnings.

## 0.0.1+1

 - **REFACTOR**: refactor exceptions.

## 0.0.1

* TODO: Describe initial release.

