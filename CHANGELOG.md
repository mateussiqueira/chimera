# Change Log

All notable changes to this project will be documented in this file.
See [Conventional Commits](https://conventionalcommits.org) for commit guidelines.

## 2023-03-24

### Changes

---

Packages with breaking changes:

 - [`alligator` - `v2.0.0`](#alligator---v200)
 - [`authentication` - `v2.0.0`](#authentication---v200)
 - [`connection` - `v2.0.0`](#connection---v200)
 - [`core` - `v2.0.0`](#core---v200)
 - [`dependencies` - `v2.0.0`](#dependencies---v200)
 - [`design_system` - `v2.0.0`](#design_system---v200)
 - [`learning` - `v2.0.0`](#learning---v200)
 - [`system_info` - `v2.0.0`](#system_info---v200)

Packages with other changes:

 - [`cart` - `v1.0.6`](#cart---v106)
 - [`certificates` - `v1.0.6`](#certificates---v106)
 - [`checkout` - `v1.1.0`](#checkout---v110)
 - [`configuration` - `v1.1.0`](#configuration---v110)
 - [`courses` - `v1.1.0`](#courses---v110)
 - [`discovery` - `v1.1.0`](#discovery---v110)
 - [`extensions` - `v1.0.6`](#extensions---v106)
 - [`generic_exception` - `v1.0.6`](#generic_exception---v106)
 - [`internationalization` - `v1.1.0`](#internationalization---v110)
 - [`iterable` - `v1.2.0`](#iterable---v120)
 - [`marcopolo` - `v1.1.0`](#marcopolo---v110)
 - [`profile` - `v1.1.0`](#profile---v110)
 - [`route66` - `v1.1.0`](#route66---v110)
 - [`share` - `v1.1.0`](#share---v110)
 - [`storage` - `v1.1.0`](#storage---v110)
 - [`storybook` - `v1.1.0`](#storybook---v110)

---

#### `alligator` - `v2.0.0`

 - **FIX**: remove warnings. ([3ec5e39d](https://github.com/qcx/chimera/commit/3ec5e39d4ed826aa144013e11ce481da7728c753))
 - **FEAT**(authentication): add google & apple login. ([e158f8e6](https://github.com/qcx/chimera/commit/e158f8e6402932f4bde32e55d0f27109c0387770))
 - **FEAT**(learning): prepare to link frontend into app. ([88718614](https://github.com/qcx/chimera/commit/88718614408d2123349f4a5001776683f06d407d))
 - **BREAKING** **CHANGE**: back all versions to 0.0.1. ([426c174a](https://github.com/qcx/chimera/commit/426c174ae5ecf465b1e53d5fa3278fc3948c4c74))

#### `authentication` - `v2.0.0`

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

#### `connection` - `v2.0.0`

 - **REFACTOR**(connection): refactor exceptions. ([d7d571ee](https://github.com/qcx/chimera/commit/d7d571ee16b8398412f9332b718e906e4f6181ee))
 - **FIX**(connection): fix interceptor refresh token issue. ([c691374f](https://github.com/qcx/chimera/commit/c691374fd08175361e08106b32de0b9594aaf6bf))
 - **FIX**(connection): fix dio method param. ([60051729](https://github.com/qcx/chimera/commit/60051729c90e42e3ccb5400265168f601e04a231))
 - **FIX**(connection): fix dio timeout error handling. ([e013d614](https://github.com/qcx/chimera/commit/e013d6147dec20f4ed1a20bc4e5c2e3e39a86c57))
 - **FIX**(connection): fix dio log url path. ([e623a2ac](https://github.com/qcx/chimera/commit/e623a2ac33740a9501c4b18fd366581186e56272))
 - **FIX**(authentication): remove token when can not refresh token. ([96e7a7f4](https://github.com/qcx/chimera/commit/96e7a7f4fda61cb8a2f67e5869dba3cfc2b208e9))
 - **FIX**(connection): fix double call when listening. ([c6060fec](https://github.com/qcx/chimera/commit/c6060feca2e292766070e4c0ecab6d44433a7244))
 - **FEAT**(connection): add dio implementation. ([2b022599](https://github.com/qcx/chimera/commit/2b022599e57b17ad065e800cd8b02c0e9869c3a8))
 - **FEAT**(discovery): init discovery module. ([6658a3c6](https://github.com/qcx/chimera/commit/6658a3c6b46debbe9a8245d7349eb907c4029763))
 - **FEAT**(connection): add http refresh adapter. ([57f2554a](https://github.com/qcx/chimera/commit/57f2554a3c8226b660af4e6873882e10491f8b00))
 - **BREAKING** **CHANGE**: back all versions to 0.0.1. ([426c174a](https://github.com/qcx/chimera/commit/426c174ae5ecf465b1e53d5fa3278fc3948c4c74))

#### `core` - `v2.0.0`

 - **REFACTOR**(core): use abstract fields in base_app. ([c5ae614c](https://github.com/qcx/chimera/commit/c5ae614cc7cae727bcf19386d1460a018a89b42f))
 - **REFACTOR**(internationalization): add internationalization package. ([ef2648f2](https://github.com/qcx/chimera/commit/ef2648f27c9aba3dc136ac5b5ed6fec3e235bf7c))
 - **REFACTOR**(core): add transitions to routes. ([cf571cb2](https://github.com/qcx/chimera/commit/cf571cb2d7149eb4c3da3d9c1f7510c3d38c6331))
 - **FIX**: remove errors. ([57bcce75](https://github.com/qcx/chimera/commit/57bcce75a2c5ede63abfe37de80dd07501cada83))
 - **FIX**(core): set default transition type. ([008ad60e](https://github.com/qcx/chimera/commit/008ad60ed99f3d4e4ec2984a0ea933e6567fa8d1))
 - **FIX**(core): iterate only need context. ([533d634e](https://github.com/qcx/chimera/commit/533d634eb12fd15942ca493cd79c0239ab299544))
 - **FEAT**: add checkout, product & menu configuration. ([46e9c6fb](https://github.com/qcx/chimera/commit/46e9c6fb69a0fb35157221c7bc4986c5ad0f3ddb))
 - **FEAT**(learning): add content page. ([c1db1b98](https://github.com/qcx/chimera/commit/c1db1b988fd06de0d7c9557f0f84751e0386a97a))
 - **FEAT**(learning): prepare to link frontend into app. ([88718614](https://github.com/qcx/chimera/commit/88718614408d2123349f4a5001776683f06d407d))
 - **DOCS**: init core README.md. ([2dc1df7f](https://github.com/qcx/chimera/commit/2dc1df7f585bbe6c579880c2d4d99815994254da))
 - **BREAKING** **CHANGE**: back all versions to 0.0.1. ([426c174a](https://github.com/qcx/chimera/commit/426c174ae5ecf465b1e53d5fa3278fc3948c4c74))

#### `dependencies` - `v2.0.0`

 - **REFACTOR**(internationalization): add internationalization package. ([ef2648f2](https://github.com/qcx/chimera/commit/ef2648f27c9aba3dc136ac5b5ed6fec3e235bf7c))
 - **FIX**: update system info dependency to v1.0.4. ([f1e5eb11](https://github.com/qcx/chimera/commit/f1e5eb11f49d3711311af57034038d892e55d91f))
 - **FIX**: fix system_info version. ([bec6db42](https://github.com/qcx/chimera/commit/bec6db422dcc1c0d7000bd2a769e6b5b3a3d8262))
 - **FIX**(dependencies): fix dependencies ref. ([952e0960](https://github.com/qcx/chimera/commit/952e0960fcf2b00057346c09592f69da1d16cb2e))
 - **FEAT**: upgrade to melos 3. ([9a80ccfa](https://github.com/qcx/chimera/commit/9a80ccfa372b0a73006c88e1a65d6b56915c8071))
 - **FEAT**: add checkout, product & menu configuration. ([46e9c6fb](https://github.com/qcx/chimera/commit/46e9c6fb69a0fb35157221c7bc4986c5ad0f3ddb))
 - **FEAT**(share): add share commons. ([4d5073ef](https://github.com/qcx/chimera/commit/4d5073ef7b7c16baa01f29aa4540b5190a66605a))
 - **FEAT**(dependencies): export collection. ([b576227d](https://github.com/qcx/chimera/commit/b576227df6f01b7fc773ea4ee5e609862010cf30))
 - **FEAT**(authentication): expose UserIsLoggedIn use case. ([9c48dc85](https://github.com/qcx/chimera/commit/9c48dc8592f92896ecb786dcc26b4449c24fb9ce))
 - **FEAT**(learning): prepare to link frontend into app. ([88718614](https://github.com/qcx/chimera/commit/88718614408d2123349f4a5001776683f06d407d))
 - **BREAKING** **CHANGE**: back all versions to 0.0.1. ([426c174a](https://github.com/qcx/chimera/commit/426c174ae5ecf465b1e53d5fa3278fc3948c4c74))

#### `design_system` - `v2.0.0`

 - **REFACTOR**: refactor button icons. ([a80ad04f](https://github.com/qcx/chimera/commit/a80ad04f95101554de46b9c5b11a129c25e63274))
 - **REFACTOR**(internationalization): add internationalization package. ([ef2648f2](https://github.com/qcx/chimera/commit/ef2648f27c9aba3dc136ac5b5ed6fec3e235bf7c))
 - **REFACTOR**(design_system): remove unused asset. ([964bea14](https://github.com/qcx/chimera/commit/964bea14e35bafbcc4d1580a22fe2927707949e6))
 - **REFACTOR**: refactor buttons standard parameters. ([9a94e85b](https://github.com/qcx/chimera/commit/9a94e85b031d543afb9b1f130b8973cdd1cb825e))
 - **REFACTOR**(connection): refactor exceptions. ([d7d571ee](https://github.com/qcx/chimera/commit/d7d571ee16b8398412f9332b718e906e4f6181ee))
 - **REFACTOR**(design_system): export material without icons and colors. ([89f1ca4e](https://github.com/qcx/chimera/commit/89f1ca4e43e1f619c92ca2229cbe7394f93ecd11))
 - **REFACTOR**(design_system): change typography style extension generics. ([709e695d](https://github.com/qcx/chimera/commit/709e695d4e7baa372d1afbde6fa694796db20b0a))
 - **REFACTOR**(storybook): refactor storybook app structure, theme, loading, progress. ([da5b2b11](https://github.com/qcx/chimera/commit/da5b2b111e1535a8a883e46cdd76505f1bafab4e))
 - **FIX**(design_system): fix typography text font names. ([b941f608](https://github.com/qcx/chimera/commit/b941f6082306713c36036f1731881769024879a5))
 - **FIX**(learning): fix content preview url. ([6e0f9d4f](https://github.com/qcx/chimera/commit/6e0f9d4f6d048793b97cbea59a67a819cf36c39c))
 - **FIX**(design_system): missing spacing in illustration widget. ([791a8ab0](https://github.com/qcx/chimera/commit/791a8ab0a1160f3a54cbde1150b9a388053d0565))
 - **FIX**(design_system): fix illustration widget align. ([5dc9a02a](https://github.com/qcx/chimera/commit/5dc9a02abe4504a847bd025afe99b1d12e22e348))
 - **FIX**(discovery): fix section header title line wrap. ([810a0982](https://github.com/qcx/chimera/commit/810a098256b58fa1a94bf2d08cf4f46c6e211969))
 - **FIX**(learning): fix course accordion icon. ([168b3718](https://github.com/qcx/chimera/commit/168b37184976ddab48f49adf385402e450728318))
 - **FIX**: fix input base widget border radius parameter. ([8fa8ea97](https://github.com/qcx/chimera/commit/8fa8ea97f914fd4d97642687e7373dd94f3b648d))
 - **FIX**(discovery): fix assessment preview widget. ([06a773b5](https://github.com/qcx/chimera/commit/06a773b53094e53e692b7198b6fcb983de3fe6ec))
 - **FIX**(design_system): fix double import issue. ([ea326068](https://github.com/qcx/chimera/commit/ea3260687ddb00b176221ca63ab97db686af2bdb))
 - **FIX**: fix font sizes, assessment info border. ([085c15c3](https://github.com/qcx/chimera/commit/085c15c3a5e85b79a0dd45d1fdce9ee3b1e4728e))
 - **FIX**(design_system): fix typography name. ([817e1b2f](https://github.com/qcx/chimera/commit/817e1b2f2870bc4d4a1fa490b72911c84ec7dce0))
 - **FIX**(design_system): add Animations & Appbar extension. ([c89be9f4](https://github.com/qcx/chimera/commit/c89be9f45848961e2929d7c2870e4418883dbe2f))
 - **FIX**(design_system): add circular progress bar center widget. ([fd7e70c1](https://github.com/qcx/chimera/commit/fd7e70c15c31523c0b9c1e56a828c96cae929da1))
 - **FIX**: fix typography line height. ([957db62b](https://github.com/qcx/chimera/commit/957db62b22312675e318701827632443845f018f))
 - **FIX**(deisgn_system): fix appbar back button. ([b407622a](https://github.com/qcx/chimera/commit/b407622a8794ef7f561ab4ac1efd2dec29309850))
 - **FIX**(learning): fix accordion completed content layout. ([56653392](https://github.com/qcx/chimera/commit/566533920c46a10e9c4089c93edc64296086e331))
 - **FIX**(design_system): merge all text widget styles params. ([eee3d457](https://github.com/qcx/chimera/commit/eee3d45755817a360bd0be998e716c1719f28dd6))
 - **FIX**: fix navbar layout. ([27d9f39d](https://github.com/qcx/chimera/commit/27d9f39d7775bdcb99f05869c929f83aaab16340))
 - **FIX**(design_system): fix theme extension copy. ([becfa5aa](https://github.com/qcx/chimera/commit/becfa5aab5d90d8e04837d0547fbc2393de0b6d0))
 - **FIX**(design_system): fix network image reload icon. ([8b190ee9](https://github.com/qcx/chimera/commit/8b190ee9ced51f3531f1380e2f6db469db200dfa))
 - **FIX**(design_system): set illustration max height. ([953f1270](https://github.com/qcx/chimera/commit/953f1270f486057299ad9e1c6b4b48807fa0529f))
 - **FEAT**(design_system): add category background. ([c5807e5c](https://github.com/qcx/chimera/commit/c5807e5cc31a2a3b56658811a78bfc2b947c2ad5))
 - **FEAT**(design_system): add animations boxfit. ([4a698582](https://github.com/qcx/chimera/commit/4a698582a1641e8c4b52e47f73d731f2a85a50a0))
 - **FEAT**(design_system): add splash animation. ([f82320f2](https://github.com/qcx/chimera/commit/f82320f2d7a10eeef5398386ae439fd8cbf507e0))
 - **FEAT**(design_system): add input widget height. ([d429fb31](https://github.com/qcx/chimera/commit/d429fb3139130fe784d29ee55a4d802ac2d32285))
 - **FEAT**(design_system): add text maxLines. ([dff2d5b0](https://github.com/qcx/chimera/commit/dff2d5b0126b773237527be66a90239033121a26))
 - **FEAT**(design_system): export BackButtonWidget. ([b28b23c1](https://github.com/qcx/chimera/commit/b28b23c10ecd2c9f4f4e40e43c170eeb06793512))
 - **FEAT**(discovery): add category page. ([5343fb2f](https://github.com/qcx/chimera/commit/5343fb2f0b257199a7409e5ba47a5f05a3bc626d))
 - **FEAT**(design_system): add chevron right icon. ([5b080c33](https://github.com/qcx/chimera/commit/5b080c33e1a6481b5e5810e7dac436443dd1785c))
 - **FEAT**(discovery): add search page. ([42eed5cc](https://github.com/qcx/chimera/commit/42eed5cc6dce19602e62b3a208b7309e47c335c5))
 - **FEAT**(discovery): init discovery module. ([6658a3c6](https://github.com/qcx/chimera/commit/6658a3c6b46debbe9a8245d7349eb907c4029763))
 - **FEAT**(discovery): add search widget clear button. ([388f0ba2](https://github.com/qcx/chimera/commit/388f0ba2fae84a1b9f81b29ee5515ada6a5fc378))
 - **FEAT**(learning): add content page. ([c1db1b98](https://github.com/qcx/chimera/commit/c1db1b988fd06de0d7c9557f0f84751e0386a97a))
 - **FEAT**(design_system): add arrow-right icon. ([1c15f46d](https://github.com/qcx/chimera/commit/1c15f46d4e5216d290205c32c0bb83c0758ec033))
 - **FEAT**: add pdf render widget. ([2966c13d](https://github.com/qcx/chimera/commit/2966c13d7c86d25bd26b70160bb737e248dec1c0))
 - **FEAT**(learning): (wip) add course content tab. ([cee39139](https://github.com/qcx/chimera/commit/cee39139f325c9da634832905ac48b657b188159))
 - **FEAT**(design_system): add expand widget. ([08d3cbd3](https://github.com/qcx/chimera/commit/08d3cbd32b85e61e7d864ad404fe91f769a5402e))
 - **FEAT**(design_system): expand widget: expand only if need. ([b6b157f7](https://github.com/qcx/chimera/commit/b6b157f7c5b303612caf9ebaf5550fbd9be31c33))
 - **FEAT**(design_system): add web view widget. ([ce4c0e72](https://github.com/qcx/chimera/commit/ce4c0e727deb9ac7570ce96634717df58b4dca19))
 - **FEAT**(design_system): add tab bar widget. ([deedb5b2](https://github.com/qcx/chimera/commit/deedb5b2c4fad79b3cd7b77215b434906a858fcb))
 - **FEAT**(design_system): add custom back button in secondary appbar. ([6f8140a5](https://github.com/qcx/chimera/commit/6f8140a5eacc985055bac9a3fea84a755dcdc6b6))
 - **FEAT**(design_system): add scroll behavior. ([ee3c011a](https://github.com/qcx/chimera/commit/ee3c011a5458f82d57e1091217c16c14fa4bc5ad))
 - **FEAT**(learning): add enrollments list pagination. ([03a2e99c](https://github.com/qcx/chimera/commit/03a2e99cc2e0403e5d244aa9caa3cca82d128877))
 - **FEAT**(learning): add no internet page in enrollments. ([1ab1b932](https://github.com/qcx/chimera/commit/1ab1b93279ba6e4ac50bd05b35c638d1788696ae))
 - **FEAT**(learning): add enrollments expiration. ([457279a3](https://github.com/qcx/chimera/commit/457279a3677c95a3c977342982df3ed50ab18b28))
 - **FEAT**(design_system): section header widget title color. ([75e76f82](https://github.com/qcx/chimera/commit/75e76f82e90420389aca7ec00992d56f03a33363))
 - **FEAT**(design_system): add Primary and Secondary AppBar. ([70541e84](https://github.com/qcx/chimera/commit/70541e84ec5bdd7cc0f322c103c2cd1ef8034bc9))
 - **FEAT**(design_system): add Illustrations images & animations. ([a9b83eec](https://github.com/qcx/chimera/commit/a9b83eec67fb472e5aa3471de8a69fe8dc90178c))
 - **FEAT**(design_system): add textAlign property in TextWidget. ([ae642881](https://github.com/qcx/chimera/commit/ae6428815ac21e199062194054e5582282d50b55))
 - **FEAT**(discovery): add product advantages. ([838d73de](https://github.com/qcx/chimera/commit/838d73de03d30cfd1ac010ed85d1b8d4f43365dc))
 - **FEAT**(learning): prepare to link frontend into app. ([88718614](https://github.com/qcx/chimera/commit/88718614408d2123349f4a5001776683f06d407d))
 - **FEAT**(design_system): add destructive button. ([78304fe4](https://github.com/qcx/chimera/commit/78304fe4ce46365fb4c1b301c4c17afd994a5d1a))
 - **FEAT**(design_system): add TextWidget decoration tags. ([2fb76f30](https://github.com/qcx/chimera/commit/2fb76f30418d7d809b4b24c2d49dca681fb30b8f))
 - **FEAT**(design_system): add text widget dynamic weight in texts. ([003246c1](https://github.com/qcx/chimera/commit/003246c11c64bb1b19bf323eb5c2fdf45bed8788))
 - **FEAT**(design_system): add linear progress center widget. ([2c131602](https://github.com/qcx/chimera/commit/2c13160216a8fbb8a8800417ee54b3932987a142))
 - **FEAT**: update appbar asset name. ([2d408357](https://github.com/qcx/chimera/commit/2d4083577e6447d718f390d0acc774e3e20ededc))
 - **FEAT**(profile): add empty state. ([50899fb6](https://github.com/qcx/chimera/commit/50899fb626f110c1e4c8731a72674fdbdfca55a7))
 - **FEAT**(design_system): change webview package. ([76a6134b](https://github.com/qcx/chimera/commit/76a6134b606a13510b96272de96af9618ed5ec49))
 - **FEAT**(design_system): add star01Filled icon. ([93a983c8](https://github.com/qcx/chimera/commit/93a983c837b838cf9c85eb8eb17d4eff4821ef48))
 - **BREAKING** **CHANGE**: back all versions to 0.0.1. ([426c174a](https://github.com/qcx/chimera/commit/426c174ae5ecf465b1e53d5fa3278fc3948c4c74))

#### `learning` - `v2.0.0`

 - **REFACTOR**(internationalization): add internationalization package. ([ef2648f2](https://github.com/qcx/chimera/commit/ef2648f27c9aba3dc136ac5b5ed6fec3e235bf7c))
 - **REFACTOR**(core): add transitions to routes. ([cf571cb2](https://github.com/qcx/chimera/commit/cf571cb2d7149eb4c3da3d9c1f7510c3d38c6331))
 - **REFACTOR**(learning): remove unused function. ([a8c2fbfc](https://github.com/qcx/chimera/commit/a8c2fbfca1d8c60c045c1c76601c56aa127a50f0))
 - **REFACTOR**(learning): refactor answered question functions. ([d55fb280](https://github.com/qcx/chimera/commit/d55fb280a184114bf0ac9a85e2554f5d8cb313ec))
 - **REFACTOR**(learning): remove default parameters. ([c39b9369](https://github.com/qcx/chimera/commit/c39b9369d1139ffb3b29e5e591eb8bc8d2c45c24))
 - **REFACTOR**(learning): refactor learning models. ([76224a22](https://github.com/qcx/chimera/commit/76224a2208648a68189c16abaed2111d967bfa16))
 - **REFACTOR**(learning): fix method name. ([9664a721](https://github.com/qcx/chimera/commit/9664a721c4d0ca24a638bb7741775a64cc608b02))
 - **FIX**: fix font sizes, assessment info border. ([085c15c3](https://github.com/qcx/chimera/commit/085c15c3a5e85b79a0dd45d1fdce9ee3b1e4728e))
 - **FIX**(learning): remove category badge if null. ([97b1bee0](https://github.com/qcx/chimera/commit/97b1bee0a032d0e02e861b94479d7b0a9e9da97b))
 - **FIX**(learning): call correct dependency. ([444ceae7](https://github.com/qcx/chimera/commit/444ceae743070e0c105565b996f67844db58ec90))
 - **FIX**: fix assessment page success return. ([da40578a](https://github.com/qcx/chimera/commit/da40578abb47bcdb63e3166957a4a22cb270daf5))
 - **FIX**: fix assessment timer dispose. ([9da9bc5f](https://github.com/qcx/chimera/commit/9da9bc5f42100a505e9e79742d0a9fb466f0b308))
 - **FIX**: fix bottom sheets align. ([96a8d4cf](https://github.com/qcx/chimera/commit/96a8d4cf8ebea3d947b5f62048e800e769469a47))
 - **FIX**: fix remote content model in video type. ([54771f42](https://github.com/qcx/chimera/commit/54771f42add2871fe73475cadefe323ade19da6a))
 - **FIX**: fix double call to NotifierMyEnrollmentsPresenter. ([80bb45d3](https://github.com/qcx/chimera/commit/80bb45d3558cfa66888452fb76028e96a7229b8a))
 - **FIX**: rollback content preview widget. ([bc424487](https://github.com/qcx/chimera/commit/bc4244877a628f1956fbf77879349a540b3fa1f2))
 - **FIX**: fix login event bus. ([6ff69bc2](https://github.com/qcx/chimera/commit/6ff69bc2076e8a5f8c272eb05b660d5faf15e72e))
 - **FIX**: fix course image usage. ([e5d29a1f](https://github.com/qcx/chimera/commit/e5d29a1f5a8489a1e3805c364a04e129c5d3c017))
 - **FIX**: fix enrollment card imports. ([42d89ed3](https://github.com/qcx/chimera/commit/42d89ed357635387c2bc5e38e24bf4957355bca9))
 - **FIX**(learning): fix tree appointment. ([0ab22037](https://github.com/qcx/chimera/commit/0ab22037ea30a5319f6fc1a41d2e157ea00daa0a))
 - **FIX**(learning): add missing bottom padding in about. ([f75b9c80](https://github.com/qcx/chimera/commit/f75b9c805730aee49579362424447d0f0677cd24))
 - **FIX**(learning): add missing product info in about. ([47e4d175](https://github.com/qcx/chimera/commit/47e4d17588d73eb5f6ebe3a317f33a9cfee688e0))
 - **FIX**(learning): add missing vertical spacing in about. ([8a0b689a](https://github.com/qcx/chimera/commit/8a0b689a5014dd96104ace03476bab8fea93ed57))
 - **FIX**(learning): fix singleton presenter call. ([f06c5a1b](https://github.com/qcx/chimera/commit/f06c5a1b80f8acc1859ebfbd4bdfc0fc8961d7e6))
 - **FIX**: remove errors. ([57bcce75](https://github.com/qcx/chimera/commit/57bcce75a2c5ede63abfe37de80dd07501cada83))
 - **FIX**(learning): fix content preview url. ([6e0f9d4f](https://github.com/qcx/chimera/commit/6e0f9d4f6d048793b97cbea59a67a819cf36c39c))
 - **FIX**(learning): fix reset selectedContent. ([21cc409c](https://github.com/qcx/chimera/commit/21cc409cfb1de3beb6451301acb12d1c89d79d4b))
 - **FIX**(learning): fix findCourses button width. ([971f1b5f](https://github.com/qcx/chimera/commit/971f1b5f884e8947326aa9be492a31f14c888967))
 - **FIX**: fix video render aspect ratio. ([ff1f7c4d](https://github.com/qcx/chimera/commit/ff1f7c4df258f37e96c3afb5b165928700dc45cd))
 - **FIX**(learning): fix course content spacing. ([9499c6b8](https://github.com/qcx/chimera/commit/9499c6b82f29a078241e4f0374f9be40f94b4b7f))
 - **FIX**(discovery): fix assessment preview widget. ([06a773b5](https://github.com/qcx/chimera/commit/06a773b53094e53e692b7198b6fcb983de3fe6ec))
 - **FIX**(learning): fix remaining days string. ([36cb1c71](https://github.com/qcx/chimera/commit/36cb1c71d012bd41dd276e9e6a22367b1b814757))
 - **FIX**(design_system): fix param name. ([b3518a5c](https://github.com/qcx/chimera/commit/b3518a5c8ce301e1321d1571fada6449effda17d))
 - **FIX**(learning): fix enrollments empty states. ([35c5a180](https://github.com/qcx/chimera/commit/35c5a1806f6aa4306194dc65e11554a45c06818f))
 - **FIX**(learning): fix list accordion border. ([95a0939e](https://github.com/qcx/chimera/commit/95a0939eda83622e1464e1e30607fd07fccad353))
 - **FIX**(learning): remove print usage. ([70dc9065](https://github.com/qcx/chimera/commit/70dc90656b7f02d32bed50e6f0fda5c5b80da643))
 - **FIX**(learning): fix accordion completed content layout. ([56653392](https://github.com/qcx/chimera/commit/566533920c46a10e9c4089c93edc64296086e331))
 - **FIX**(learning): fix enrollment card top padding. ([87e160db](https://github.com/qcx/chimera/commit/87e160db491027223cf963d03612faf5588bc1da))
 - **FEAT**(learning): add pagination in enrollments. ([a02831f8](https://github.com/qcx/chimera/commit/a02831f8cc85d083f6faaa0800eb7817ef4de32a))
 - **FEAT**(learning): add content page. ([c1db1b98](https://github.com/qcx/chimera/commit/c1db1b988fd06de0d7c9557f0f84751e0386a97a))
 - **FEAT**(courses): add toggle content progress. ([0570eeb2](https://github.com/qcx/chimera/commit/0570eeb26b21ef95fd8e02d72ecf72daacf6a8e8))
 - **FEAT**: add pdf render widget. ([2966c13d](https://github.com/qcx/chimera/commit/2966c13d7c86d25bd26b70160bb737e248dec1c0))
 - **FEAT**(learning): (wip) add course content tab. ([cee39139](https://github.com/qcx/chimera/commit/cee39139f325c9da634832905ac48b657b188159))
 - **FEAT**(learning): update course after assessment end. ([f07db47b](https://github.com/qcx/chimera/commit/f07db47be729ef79dc428f21b49f017337a47354))
 - **FEAT**(discovery): init discovery module. ([6658a3c6](https://github.com/qcx/chimera/commit/6658a3c6b46debbe9a8245d7349eb907c4029763))
 - **FEAT**(learning): add enrollments list pagination. ([03a2e99c](https://github.com/qcx/chimera/commit/03a2e99cc2e0403e5d244aa9caa3cca82d128877))
 - **FEAT**(learning): add no internet page in enrollments. ([1ab1b932](https://github.com/qcx/chimera/commit/1ab1b93279ba6e4ac50bd05b35c638d1788696ae))
 - **FEAT**(learning): add enrollments expiration. ([457279a3](https://github.com/qcx/chimera/commit/457279a3677c95a3c977342982df3ed50ab18b28))
 - **FEAT**(learning): add my enrollments call. ([8036cf73](https://github.com/qcx/chimera/commit/8036cf731522c989ae36b982158288c5c0c47e19))
 - **FEAT**(learning): add sliverappbar in course page. ([a5db73f9](https://github.com/qcx/chimera/commit/a5db73f98a78e4f69f0acb7ba1b52257c42c7326))
 - **FEAT**(learning): prepare to link frontend into app. ([88718614](https://github.com/qcx/chimera/commit/88718614408d2123349f4a5001776683f06d407d))
 - **FEAT**(learning): update about course progress. ([f1356b55](https://github.com/qcx/chimera/commit/f1356b55c2ca34655da19016bd46501beb438a88))
 - **DOCS**: add learning README.md. ([04352e7b](https://github.com/qcx/chimera/commit/04352e7b85915224c697801d160f27bbe46fc786))
 - **BREAKING** **CHANGE**: back all versions to 0.0.1. ([426c174a](https://github.com/qcx/chimera/commit/426c174ae5ecf465b1e53d5fa3278fc3948c4c74))

#### `system_info` - `v2.0.0`

 - **REFACTOR**(connection): refactor exceptions. ([d7d571ee](https://github.com/qcx/chimera/commit/d7d571ee16b8398412f9332b718e906e4f6181ee))
 - **FIX**(system_info): fix dependencies ref. ([56ede8f5](https://github.com/qcx/chimera/commit/56ede8f53994b5d1d1458f983ab47f87d2763998))
 - **BREAKING** **CHANGE**: back all versions to 0.0.1. ([426c174a](https://github.com/qcx/chimera/commit/426c174ae5ecf465b1e53d5fa3278fc3948c4c74))

#### `cart` - `v1.0.6`

 - **REFACTOR**(cart): add trailing comma. ([b6d71316](https://github.com/qcx/chimera/commit/b6d7131639527a1c0509231fbae2c3390ce134ab))
 - **FIX**: fix cart item length. ([d2063a4a](https://github.com/qcx/chimera/commit/d2063a4a057b4497cd0fed1c22074caf2f6be015))
 - **FIX**: fix sdk version. ([7a48733f](https://github.com/qcx/chimera/commit/7a48733f9d9e4f32fa7d8fea4c90f2dbbfd3df3b))

#### `certificates` - `v1.0.6`

 - **REFACTOR**(profile): remove default parameters. ([75f50205](https://github.com/qcx/chimera/commit/75f502051d2f08226214509903870141292329ac))

#### `checkout` - `v1.1.0`

 - **REFACTOR**: format file. ([a0af5657](https://github.com/qcx/chimera/commit/a0af5657c6ad72744df8e0c2b0bdb6e81c7c2086))
 - **REFACTOR**(checkout): remove default parameter. ([cca016c7](https://github.com/qcx/chimera/commit/cca016c7965abd04e07dfdbe360583dd1d0678c9))
 - **FIX**: fix crashlytics issue. ([ad5e18b7](https://github.com/qcx/chimera/commit/ad5e18b75e2b2f615e2b1083e98e0c8e139b706c))
 - **FIX**: fix cart reduce nullable. ([663b869d](https://github.com/qcx/chimera/commit/663b869dc1e3be5d59a8a592a4b42b9fdf712a92))
 - **FIX**: fix cart item length. ([d2063a4a](https://github.com/qcx/chimera/commit/d2063a4a057b4497cd0fed1c22074caf2f6be015))
 - **FEAT**: add checkout, product & menu configuration. ([46e9c6fb](https://github.com/qcx/chimera/commit/46e9c6fb69a0fb35157221c7bc4986c5ad0f3ddb))
 - **DOCS**: improve checkout README.md readability. ([48566eb5](https://github.com/qcx/chimera/commit/48566eb52294414645302411284ad8be9f97326a))
 - **DOCS**: add checkout README.md. ([2173f418](https://github.com/qcx/chimera/commit/2173f418194a32831b1bc66959fb9cf6e9250b59))

#### `configuration` - `v1.1.0`

 - **FEAT**: add checkout, product & menu configuration. ([46e9c6fb](https://github.com/qcx/chimera/commit/46e9c6fb69a0fb35157221c7bc4986c5ad0f3ddb))

#### `courses` - `v1.1.0`

 - **REFACTOR**(discovery): refactor product card home. ([30707b57](https://github.com/qcx/chimera/commit/30707b57809d28eab44b3cd42c2cc17fbe1ca5fb))
 - **REFACTOR**(discovery): refactor product page. ([8b065d31](https://github.com/qcx/chimera/commit/8b065d3178da9d11db89816b4e89f2da3b533fe9))
 - **FIX**: fix font sizes, assessment info border. ([085c15c3](https://github.com/qcx/chimera/commit/085c15c3a5e85b79a0dd45d1fdce9ee3b1e4728e))
 - **FIX**(learning): fix selected content. ([4f470a41](https://github.com/qcx/chimera/commit/4f470a4137b93e0a90035dddc05785386e4c1a9c))
 - **FEAT**(courses): add toggle content progress. ([0570eeb2](https://github.com/qcx/chimera/commit/0570eeb26b21ef95fd8e02d72ecf72daacf6a8e8))

#### `discovery` - `v1.1.0`

 - **REFACTOR**(discovery): remove unused getter. ([2a72688e](https://github.com/qcx/chimera/commit/2a72688eb2a179c580023bf35d150a0c08d5139c))
 - **REFACTOR**(discovery): remove default parameter / unused scope dependency. ([9e7b91e8](https://github.com/qcx/chimera/commit/9e7b91e8febb2a44a0f5d2eac375228c36b61142))
 - **REFACTOR**(discovery): refactor entire home page. ([20abc0c4](https://github.com/qcx/chimera/commit/20abc0c4118b4cc4d63a235b0c08ee424f1d1526))
 - **REFACTOR**(discovery): refactor product card home. ([30707b57](https://github.com/qcx/chimera/commit/30707b57809d28eab44b3cd42c2cc17fbe1ca5fb))
 - **REFACTOR**(discovery): refactor product page. ([8b065d31](https://github.com/qcx/chimera/commit/8b065d3178da9d11db89816b4e89f2da3b533fe9))
 - **REFACTOR**(internationalization): add internationalization package. ([ef2648f2](https://github.com/qcx/chimera/commit/ef2648f27c9aba3dc136ac5b5ed6fec3e235bf7c))
 - **REFACTOR**(discovery): move advantage strings. ([5c1429ef](https://github.com/qcx/chimera/commit/5c1429ef32f8713dee62a638cf7c4a51350e8db0))
 - **FIX**: remove errors. ([57bcce75](https://github.com/qcx/chimera/commit/57bcce75a2c5ede63abfe37de80dd07501cada83))
 - **FIX**: fix wrong padding in category info page. ([d5c84662](https://github.com/qcx/chimera/commit/d5c846623554e56383d81f2d4364a47085de6b84))
 - **FIX**(discovery): fix warning. ([723e626c](https://github.com/qcx/chimera/commit/723e626cd2f96b25e246c726989aaba3c6e3d052))
 - **FIX**: fix suggestion title color. ([26e1ca52](https://github.com/qcx/chimera/commit/26e1ca529f4c278d0a57f5daea5c4f2a76e01194))
 - **FIX**: fix search badges. ([95359486](https://github.com/qcx/chimera/commit/95359486261899fbc87e324567e3ba9ebf1863e9))
 - **FIX**: fix search widget clear tap behavior. ([24e6ca0b](https://github.com/qcx/chimera/commit/24e6ca0b922ee953a82d033f71bacef11a7ad757))
 - **FIX**: fix search widget input action. ([5b5622f1](https://github.com/qcx/chimera/commit/5b5622f1c9a3cc2e353c67f8dbce4cbeddad3b8c))
 - **FIX**: fix empty group items. ([635e1f64](https://github.com/qcx/chimera/commit/635e1f649a334adb6f153f749fb6a4e194438960))
 - **FIX**(discovery): fix categories unbounded height. ([eb58a620](https://github.com/qcx/chimera/commit/eb58a620a1c2c3763e6d08d0b492a06d7f1790d7))
 - **FIX**: fix font sizes, assessment info border. ([085c15c3](https://github.com/qcx/chimera/commit/085c15c3a5e85b79a0dd45d1fdce9ee3b1e4728e))
 - **FIX**(discovery): fix search widget. ([322c5c7d](https://github.com/qcx/chimera/commit/322c5c7dec42e5add0f93ffc24a66cbfeb2cf51c))
 - **FIX**(discovery): fix search page input behavior. ([ef01b8db](https://github.com/qcx/chimera/commit/ef01b8db82b7311950fab7e8aee991fae066587b))
 - **FIX**(discovery): fix pdp bottom padding. ([2114ee61](https://github.com/qcx/chimera/commit/2114ee61e5fbffe7cab7aa5bf1cb7a2919df4371))
 - **FIX**(discovery): fix pdp scroll behavior. ([c3b8a2d7](https://github.com/qcx/chimera/commit/c3b8a2d7fbc494526d6d6e590ea6eba29aedf8a7))
 - **FIX**(discovery): fix goals. ([3882fa02](https://github.com/qcx/chimera/commit/3882fa020a2bf88a23951d13fa12a473d6515399))
 - **FIX**: fix category products page. ([f5f30440](https://github.com/qcx/chimera/commit/f5f304404be8beb53b64ef50163edcb3732684ea))
 - **FIX**(discovery): fix overflow in add to cart button. ([2d1e3408](https://github.com/qcx/chimera/commit/2d1e3408302d573d620244468b98ca34890bfe18))
 - **FIX**(discovery): fix search page loading. ([fa071611](https://github.com/qcx/chimera/commit/fa071611e9804796670a8c586b0dc79f2284c222))
 - **FIX**: fix divider color. ([2252be89](https://github.com/qcx/chimera/commit/2252be89e976bcaf9fb4c57a7ec58d55c7ad29e6))
 - **FIX**(discovery): fix search page transition. ([ce67c8a5](https://github.com/qcx/chimera/commit/ce67c8a5a5bc3c49b989e60a275d7cbc597df79e))
 - **FIX**(discovery): go to category page if section is category. ([ff2d65d8](https://github.com/qcx/chimera/commit/ff2d65d82797cbdc23071cdcfa95a7de1251b93d))
 - **FIX**(discovery): fix product page also bought spacing. ([b55be963](https://github.com/qcx/chimera/commit/b55be963b64ede7e7e41af88a9f48d520a767abb))
 - **FIX**(discovery): fix product page spacing. ([003ca29a](https://github.com/qcx/chimera/commit/003ca29aac5533ea46cafd356dd45ef558cb97c4))
 - **FIX**(discovery): fix layout issues in search. ([30ffd3fa](https://github.com/qcx/chimera/commit/30ffd3fa2fad38206339e0d202a2c7f0a55e972c))
 - **FIX**(discovery): fix pubspec.yaml & melos dep in last version. ([69372e3d](https://github.com/qcx/chimera/commit/69372e3d0e704a5304618468b5106fdefed79d90))
 - **FIX**(discovery): fix home image. ([f52ee2e1](https://github.com/qcx/chimera/commit/f52ee2e16ad34fa0236150ab9413f0a4f4cb9731))
 - **FIX**(discovery): remove recent searches if empty. ([262f2031](https://github.com/qcx/chimera/commit/262f20313138a16621246d2efaf600ba25150f56))
 - **FIX**(discovery): fix category page padding. ([7539f808](https://github.com/qcx/chimera/commit/7539f8081f0ab0e95d59bc6806c4f90d38b2f82c))
 - **FIX**(design_system): fix param name. ([b3518a5c](https://github.com/qcx/chimera/commit/b3518a5c8ce301e1321d1571fada6449effda17d))
 - **FIX**(discovery): fix home page blue container. ([89602d0d](https://github.com/qcx/chimera/commit/89602d0dfbd977d8b9c09a305780bc9f19fce88b))
 - **FIX**(discovery): fix search tab transition type. ([9a265aa0](https://github.com/qcx/chimera/commit/9a265aa08a06ac08df5123fd4d8be8d14ec9939a))
 - **FIX**(discovery): fix category & products names. ([69d9dda0](https://github.com/qcx/chimera/commit/69d9dda0095b5c103ec7dddb48f990a18ac799d1))
 - **FEAT**(discovery): init discovery module. ([6658a3c6](https://github.com/qcx/chimera/commit/6658a3c6b46debbe9a8245d7349eb907c4029763))
 - **FEAT**(discovery): add product advantages. ([838d73de](https://github.com/qcx/chimera/commit/838d73de03d30cfd1ac010ed85d1b8d4f43365dc))
 - **FEAT**(discovery): update search categories size & color. ([01b02331](https://github.com/qcx/chimera/commit/01b023310d5110fbc106433354a5d33dce3216c0))
 - **FEAT**(discovery): add recent viewed products. ([7b95a0c5](https://github.com/qcx/chimera/commit/7b95a0c5c51fc102825e1eae3f3e1c6ec1474d0d))
 - **FEAT**(discovery): add course content in pdp. ([b8b15f2f](https://github.com/qcx/chimera/commit/b8b15f2f949b1a8454535efa8245cb8c18357b81))
 - **FEAT**(share): add share commons. ([4d5073ef](https://github.com/qcx/chimera/commit/4d5073ef7b7c16baa01f29aa4540b5190a66605a))
 - **FEAT**(discovery): add recent searches. ([83a45be5](https://github.com/qcx/chimera/commit/83a45be53c68c13f5dd11e78255c02292ad69eb7))
 - **FEAT**(discovery): add call to top searches. ([d11773cc](https://github.com/qcx/chimera/commit/d11773cc47fd1a02ddddb15d69a6fdb5402324a4))
 - **FEAT**: add checkout, product & menu configuration. ([46e9c6fb](https://github.com/qcx/chimera/commit/46e9c6fb69a0fb35157221c7bc4986c5ad0f3ddb))
 - **FEAT**(discovery): add search widget clear button. ([388f0ba2](https://github.com/qcx/chimera/commit/388f0ba2fae84a1b9f81b29ee5515ada6a5fc378))
 - **FEAT**(discovery): add search page. ([42eed5cc](https://github.com/qcx/chimera/commit/42eed5cc6dce19602e62b3a208b7309e47c335c5))
 - **FEAT**(discovery): add category page. ([5343fb2f](https://github.com/qcx/chimera/commit/5343fb2f0b257199a7409e5ba47a5f05a3bc626d))
 - **FEAT**(discovery): update search page. ([12359472](https://github.com/qcx/chimera/commit/12359472efc9570820069461d248b52dabec5dbe))
 - **FEAT**(discovery): add buy item event. ([15444a76](https://github.com/qcx/chimera/commit/15444a760354d526f20d96e37e9745a69611e20b))
 - **FEAT**(search): add autofocus in search input. ([c8f5ebad](https://github.com/qcx/chimera/commit/c8f5ebad0dcf4157cd1d4356bcf7ace2edfd737b))
 - **FEAT**(discovery): add home see more linear-radial card. ([139324f7](https://github.com/qcx/chimera/commit/139324f71878d904b42eecd6b1273a70fff82699))
 - **FEAT**(discovery): add product list page. ([6c7f125e](https://github.com/qcx/chimera/commit/6c7f125e71b67a3f61bce606d471315b6e525cc3))
 - **FEAT**(discovery): add currency format example. ([1cfb1338](https://github.com/qcx/chimera/commit/1cfb1338642d37527565b8cce2f84341d988cda5))
 - **FEAT**(discovery): add home product groups. ([b551c64c](https://github.com/qcx/chimera/commit/b551c64c9fa3978660094933ae23410f1a4d8bbc))
 - **FEAT**(discovery): add also bought in pdp. ([9952e8ae](https://github.com/qcx/chimera/commit/9952e8aed4956efb1eb9dc699b12f1395027022d))
 - **DOCS**: add discovery README.md. ([e909b5e4](https://github.com/qcx/chimera/commit/e909b5e45a8e08a0c22c6480c470b970c595e59b))

#### `extensions` - `v1.0.6`

 - **REFACTOR**(internationalization): add internationalization package. ([ef2648f2](https://github.com/qcx/chimera/commit/ef2648f27c9aba3dc136ac5b5ed6fec3e235bf7c))

#### `generic_exception` - `v1.0.6`

 - **REFACTOR**(internationalization): add internationalization package. ([ef2648f2](https://github.com/qcx/chimera/commit/ef2648f27c9aba3dc136ac5b5ed6fec3e235bf7c))
 - **REFACTOR**(generic_exception): add DomainError. ([fb0cf27d](https://github.com/qcx/chimera/commit/fb0cf27d1dbacfa6221864d901d15f094d176b32))

#### `internationalization` - `v1.1.0`

 - **REFACTOR**(internationalization): add internationalization package. ([ef2648f2](https://github.com/qcx/chimera/commit/ef2648f27c9aba3dc136ac5b5ed6fec3e235bf7c))
 - **FIX**: fix certificate page. ([19d340f7](https://github.com/qcx/chimera/commit/19d340f77c5998eee063c9817399c09b1795260e))
 - **FIX**: fix font sizes, assessment info border. ([085c15c3](https://github.com/qcx/chimera/commit/085c15c3a5e85b79a0dd45d1fdce9ee3b1e4728e))
 - **FEAT**(profile): add delete account bottom sheet. ([ff90571a](https://github.com/qcx/chimera/commit/ff90571aa29fbb6c40f7ce2524420e14ac2f8a8c))
 - **FEAT**(learning): update about course progress. ([f1356b55](https://github.com/qcx/chimera/commit/f1356b55c2ca34655da19016bd46501beb438a88))
 - **FEAT**(authentication): add google & apple login. ([e158f8e6](https://github.com/qcx/chimera/commit/e158f8e6402932f4bde32e55d0f27109c0387770))
 - **FEAT**(profile): add empty state. ([50899fb6](https://github.com/qcx/chimera/commit/50899fb626f110c1e4c8731a72674fdbdfca55a7))

#### `iterable` - `v1.2.0`

 - **FIX**: fix certificate page. ([19d340f7](https://github.com/qcx/chimera/commit/19d340f77c5998eee063c9817399c09b1795260e))
 - **FEAT**: upgrade to melos 3. ([9a80ccfa](https://github.com/qcx/chimera/commit/9a80ccfa372b0a73006c88e1a65d6b56915c8071))

#### `marcopolo` - `v1.1.0`

 - **REFACTOR**(discovery): refactor product card home. ([30707b57](https://github.com/qcx/chimera/commit/30707b57809d28eab44b3cd42c2cc17fbe1ca5fb))
 - **REFACTOR**(authentication): use event bus insted of nav. ([40839e0a](https://github.com/qcx/chimera/commit/40839e0ac8f37698b1f27cc7587b653491d0a5ca))
 - **FIX**: fix cart item length. ([d2063a4a](https://github.com/qcx/chimera/commit/d2063a4a057b4497cd0fed1c22074caf2f6be015))
 - **FIX**: remove errors. ([57bcce75](https://github.com/qcx/chimera/commit/57bcce75a2c5ede63abfe37de80dd07501cada83))
 - **FIX**(marcopolo): remove android ios folders. ([e1cae85e](https://github.com/qcx/chimera/commit/e1cae85ed924ae840e6efa8da03f483b7b4e6cba))
 - **FIX**(marcopolo): fix sdk constraints. ([b9149cf9](https://github.com/qcx/chimera/commit/b9149cf97f6ca94188d7bacecd8d9b1f23da63de))
 - **FEAT**(learning): update course after assessment end. ([f07db47b](https://github.com/qcx/chimera/commit/f07db47be729ef79dc428f21b49f017337a47354))
 - **FEAT**(discovery): add buy item event. ([15444a76](https://github.com/qcx/chimera/commit/15444a760354d526f20d96e37e9745a69611e20b))

#### `profile` - `v1.1.0`

 - **REFACTOR**(profile): remove default parameters. ([75f50205](https://github.com/qcx/chimera/commit/75f502051d2f08226214509903870141292329ac))
 - **REFACTOR**(authentication): use event bus insted of nav. ([40839e0a](https://github.com/qcx/chimera/commit/40839e0ac8f37698b1f27cc7587b653491d0a5ca))
 - **REFACTOR**(profile): refactor profile page widgets. ([8da440e1](https://github.com/qcx/chimera/commit/8da440e10095d1cdcc5b7160c43f345ead0fce8c))
 - **REFACTOR**(internationalization): add internationalization package. ([ef2648f2](https://github.com/qcx/chimera/commit/ef2648f27c9aba3dc136ac5b5ed6fec3e235bf7c))
 - **FIX**: fix account deletion pop. ([7fb15d62](https://github.com/qcx/chimera/commit/7fb15d6298cbb8c3140c92203bb9f5dd22976f8e))
 - **FIX**: fix certificates scroll. ([4b291816](https://github.com/qcx/chimera/commit/4b291816fdf2e90dea80bd91d2089a6a0c1c2c16))
 - **FIX**: fix certificate page. ([19d340f7](https://github.com/qcx/chimera/commit/19d340f77c5998eee063c9817399c09b1795260e))
 - **FIX**: fix login event bus. ([6ff69bc2](https://github.com/qcx/chimera/commit/6ff69bc2076e8a5f8c272eb05b660d5faf15e72e))
 - **FIX**: remove errors. ([57bcce75](https://github.com/qcx/chimera/commit/57bcce75a2c5ede63abfe37de80dd07501cada83))
 - **FIX**(profile): update wrong spacing. ([05ad5e5e](https://github.com/qcx/chimera/commit/05ad5e5e4766fc997c359d47090669fd4cc28b92))
 - **FIX**(profile): fix errors. ([aea7b1f4](https://github.com/qcx/chimera/commit/aea7b1f47febf07686728b7ac9dd10e16889c476))
 - **FIX**(design_system): fix param name. ([b3518a5c](https://github.com/qcx/chimera/commit/b3518a5c8ce301e1321d1571fada6449effda17d))
 - **FEAT**: save user locally. ([042d3d5e](https://github.com/qcx/chimera/commit/042d3d5e23f9a2ddb1558bcf069f1e92e35c5636))
 - **FEAT**: add checkout, product & menu configuration. ([46e9c6fb](https://github.com/qcx/chimera/commit/46e9c6fb69a0fb35157221c7bc4986c5ad0f3ddb))
 - **FEAT**(profile): add delete account bottom sheet. ([ff90571a](https://github.com/qcx/chimera/commit/ff90571aa29fbb6c40f7ce2524420e14ac2f8a8c))
 - **FEAT**(profile): add loading state. ([a1cc098d](https://github.com/qcx/chimera/commit/a1cc098dd2cbf1496d5a316138c0deb0a4fe1a35))
 - **FEAT**(profile): add empty state. ([50899fb6](https://github.com/qcx/chimera/commit/50899fb626f110c1e4c8731a72674fdbdfca55a7))
 - **FEAT**(profile): add module. ([467a308f](https://github.com/qcx/chimera/commit/467a308fd4fe6086f721498e2f5fb44320dd7243))
 - **DOCS**: add profile README.md. ([f48aafff](https://github.com/qcx/chimera/commit/f48aaffff0d8fb99bded08d6f7dd401272c392e4))

#### `route66` - `v1.1.0`

 - **REFACTOR**(authentication): use event bus insted of nav. ([40839e0a](https://github.com/qcx/chimera/commit/40839e0ac8f37698b1f27cc7587b653491d0a5ca))
 - **FIX**: remove errors. ([57bcce75](https://github.com/qcx/chimera/commit/57bcce75a2c5ede63abfe37de80dd07501cada83))
 - **FIX**(route66): fix navbar widget size. ([5a3b9678](https://github.com/qcx/chimera/commit/5a3b967824ab5cd1eac8bdb781d433abd5e7da08))
 - **FIX**(route66): update navbar when change routes by micro app. ([7ac6a765](https://github.com/qcx/chimera/commit/7ac6a7650fa2bb3aecc6cbf2cd1fd55ca3378b75))
 - **FIX**: fix icons size. ([b7c75c97](https://github.com/qcx/chimera/commit/b7c75c9703ea157ca9e60262dce0fed0e497bcca))
 - **FIX**: fix navbar layout. ([27d9f39d](https://github.com/qcx/chimera/commit/27d9f39d7775bdcb99f05869c929f83aaab16340))
 - **FIX**(route66): fix warnings. ([a1f3606c](https://github.com/qcx/chimera/commit/a1f3606c2921ae5157fdd28a2d08012c38588866))
 - **FEAT**(discovery): add buy item event. ([15444a76](https://github.com/qcx/chimera/commit/15444a760354d526f20d96e37e9745a69611e20b))

#### `share` - `v1.1.0`

 - **FEAT**(share): add share commons. ([4d5073ef](https://github.com/qcx/chimera/commit/4d5073ef7b7c16baa01f29aa4540b5190a66605a))

#### `storage` - `v1.1.0`

 - **FEAT**(discovery): add recent searches. ([83a45be5](https://github.com/qcx/chimera/commit/83a45be53c68c13f5dd11e78255c02292ad69eb7))

#### `storybook` - `v1.1.0`

 - **REFACTOR**(design_system): export material without icons and colors. ([89f1ca4e](https://github.com/qcx/chimera/commit/89f1ca4e43e1f619c92ca2229cbe7394f93ecd11))
 - **REFACTOR**(storybook): refactor storybook app structure, theme, loading, progress. ([da5b2b11](https://github.com/qcx/chimera/commit/da5b2b111e1535a8a883e46cdd76505f1bafab4e))
 - **REFACTOR**: refactor button icons. ([a80ad04f](https://github.com/qcx/chimera/commit/a80ad04f95101554de46b9c5b11a129c25e63274))
 - **FIX**: remove warning. ([33473716](https://github.com/qcx/chimera/commit/33473716efd6312cfd32c7da68ff66422ef864e0))
 - **FIX**: remove warning. ([4af24f37](https://github.com/qcx/chimera/commit/4af24f37abda829668dd6ab5c4461fbc9369fe04))
 - **FIX**(learning): fix accordion completed content layout. ([56653392](https://github.com/qcx/chimera/commit/566533920c46a10e9c4089c93edc64296086e331))
 - **FIX**(design_system): fix theme extension copy. ([becfa5aa](https://github.com/qcx/chimera/commit/becfa5aab5d90d8e04837d0547fbc2393de0b6d0))
 - **FIX**(storybook): fix stories names. ([66802eef](https://github.com/qcx/chimera/commit/66802eef2885fb6f2fa1a5db827285a2632fad0d))
 - **FIX**: fix typography line height. ([957db62b](https://github.com/qcx/chimera/commit/957db62b22312675e318701827632443845f018f))
 - **FEAT**(profile): add empty state. ([50899fb6](https://github.com/qcx/chimera/commit/50899fb626f110c1e4c8731a72674fdbdfca55a7))
 - **FEAT**(design_system): add expand widget. ([08d3cbd3](https://github.com/qcx/chimera/commit/08d3cbd32b85e61e7d864ad404fe91f769a5402e))
 - **FEAT**(design_system): add splash animation. ([f82320f2](https://github.com/qcx/chimera/commit/f82320f2d7a10eeef5398386ae439fd8cbf507e0))
 - **FEAT**(learning): add content page. ([c1db1b98](https://github.com/qcx/chimera/commit/c1db1b988fd06de0d7c9557f0f84751e0386a97a))
 - **FEAT**(design_system): add web view widget. ([ce4c0e72](https://github.com/qcx/chimera/commit/ce4c0e727deb9ac7570ce96634717df58b4dca19))
 - **FEAT**(design_system): add tab bar widget. ([deedb5b2](https://github.com/qcx/chimera/commit/deedb5b2c4fad79b3cd7b77215b434906a858fcb))
 - **FEAT**(design_system): add Primary and Secondary AppBar. ([70541e84](https://github.com/qcx/chimera/commit/70541e84ec5bdd7cc0f322c103c2cd1ef8034bc9))
 - **FEAT**(design_system): add Illustrations images & animations. ([a9b83eec](https://github.com/qcx/chimera/commit/a9b83eec67fb472e5aa3471de8a69fe8dc90178c))
 - **FEAT**(learning): prepare to link frontend into app. ([88718614](https://github.com/qcx/chimera/commit/88718614408d2123349f4a5001776683f06d407d))


## 2023-03-13

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`dependencies` - `v1.1.1`](#dependencies---v111)
 - [`authentication` - `v1.0.5`](#authentication---v105)
 - [`alligator` - `v1.0.5`](#alligator---v105)
 - [`internationalization` - `v1.0.5`](#internationalization---v105)
 - [`connection` - `v1.0.5`](#connection---v105)
 - [`extensions` - `v1.0.5`](#extensions---v105)
 - [`route66` - `v1.0.5`](#route66---v105)
 - [`courses` - `v1.0.5`](#courses---v105)
 - [`certificates` - `v1.0.5`](#certificates---v105)
 - [`core` - `v1.0.5`](#core---v105)
 - [`learning` - `v1.1.3`](#learning---v113)
 - [`share` - `v1.0.5`](#share---v105)
 - [`cart` - `v1.0.5`](#cart---v105)
 - [`checkout` - `v1.0.5`](#checkout---v105)
 - [`profile` - `v1.0.5`](#profile---v105)
 - [`system_info` - `v1.0.5`](#system_info---v105)
 - [`discovery` - `v1.0.5`](#discovery---v105)
 - [`generic_exception` - `v1.0.5`](#generic_exception---v105)
 - [`design_system` - `v1.1.3`](#design_system---v113)
 - [`iterable` - `v1.1.1`](#iterable---v111)
 - [`storybook` - `v1.0.5`](#storybook---v105)
 - [`configuration` - `v1.0.5`](#configuration---v105)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `authentication` - `v1.0.5`
 - `alligator` - `v1.0.5`
 - `internationalization` - `v1.0.5`
 - `connection` - `v1.0.5`
 - `extensions` - `v1.0.5`
 - `route66` - `v1.0.5`
 - `courses` - `v1.0.5`
 - `certificates` - `v1.0.5`
 - `core` - `v1.0.5`
 - `learning` - `v1.1.3`
 - `share` - `v1.0.5`
 - `cart` - `v1.0.5`
 - `checkout` - `v1.0.5`
 - `profile` - `v1.0.5`
 - `system_info` - `v1.0.5`
 - `discovery` - `v1.0.5`
 - `generic_exception` - `v1.0.5`
 - `design_system` - `v1.1.3`
 - `iterable` - `v1.1.1`
 - `storybook` - `v1.0.5`
 - `configuration` - `v1.0.5`

---

#### `dependencies` - `v1.1.1`

 - **FIX**: update system info dependency to v1.0.4.


## 2023-03-13

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`dependencies` - `v1.1.0`](#dependencies---v110)
 - [`iterable` - `v1.1.0`](#iterable---v110)
 - [`authentication` - `v1.0.4`](#authentication---v104)
 - [`connection` - `v1.0.4`](#connection---v104)
 - [`courses` - `v1.0.4`](#courses---v104)
 - [`cart` - `v1.0.4`](#cart---v104)
 - [`system_info` - `v1.0.4`](#system_info---v104)
 - [`certificates` - `v1.0.4`](#certificates---v104)
 - [`discovery` - `v1.0.4`](#discovery---v104)
 - [`checkout` - `v1.0.4`](#checkout---v104)
 - [`route66` - `v1.0.4`](#route66---v104)
 - [`profile` - `v1.0.4`](#profile---v104)
 - [`learning` - `v1.1.2`](#learning---v112)
 - [`internationalization` - `v1.0.4`](#internationalization---v104)
 - [`core` - `v1.0.4`](#core---v104)
 - [`extensions` - `v1.0.4`](#extensions---v104)
 - [`share` - `v1.0.4`](#share---v104)
 - [`alligator` - `v1.0.4`](#alligator---v104)
 - [`generic_exception` - `v1.0.4`](#generic_exception---v104)
 - [`design_system` - `v1.1.2`](#design_system---v112)
 - [`storybook` - `v1.0.4`](#storybook---v104)
 - [`configuration` - `v1.0.4`](#configuration---v104)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `authentication` - `v1.0.4`
 - `connection` - `v1.0.4`
 - `courses` - `v1.0.4`
 - `cart` - `v1.0.4`
 - `system_info` - `v1.0.4`
 - `certificates` - `v1.0.4`
 - `discovery` - `v1.0.4`
 - `checkout` - `v1.0.4`
 - `route66` - `v1.0.4`
 - `profile` - `v1.0.4`
 - `learning` - `v1.1.2`
 - `internationalization` - `v1.0.4`
 - `core` - `v1.0.4`
 - `extensions` - `v1.0.4`
 - `share` - `v1.0.4`
 - `alligator` - `v1.0.4`
 - `generic_exception` - `v1.0.4`
 - `design_system` - `v1.1.2`
 - `storybook` - `v1.0.4`
 - `configuration` - `v1.0.4`

---

#### `dependencies` - `v1.1.0`

 - **FEAT**: upgrade to melos 3.

#### `iterable` - `v1.1.0`

 - **FEAT**: upgrade to melos 3.

