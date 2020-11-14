<p align="center"><img src="https://avatars3.githubusercontent.com/u/45311177?s=200&v=4"></p>

<p align="center">

![Coding standards status](https://github.com/nuxed/contract/workflows/coding%20standards/badge.svg?branch=develop)
![Coding standards status](https://github.com/nuxed/contract/workflows/static%20analysis/badge.svg?branch=develop)
[![Total Downloads](https://poser.pugx.org/nuxed/contract/d/total.svg)](https://packagist.org/packages/nuxed/contract)
[![Latest Stable Version](https://poser.pugx.org/nuxed/contract/v/stable.svg)](https://packagist.org/packages/nuxed/contract)
[![License](https://poser.pugx.org/nuxed/contract/license.svg)](https://packagist.org/packages/nuxed/contract)

</p>

# Nuxed Contract

A set of abstractions extracted out of the Nuxed components

The abstractions in this package are useful to achieve loose coupling and interoperability. By using the provided interfaces as type hints, you are able to reuse any implementations that match their contracts. It could be a Nuxed component, or another one provided by the Hack community at large.

### Installation

This package can be installed with [Composer](https://getcomposer.org).

```console
$ composer require nuxed/contract
```

### Design Principles

- contracts are split by domain, each into their own sub-namespaces;
- contracts are small and consistent sets of Hack interfaces, traits, normative docblocks and reference test suites when applicable, ...;
- all contracts must have a proven use case, or implementation to enter this repository;

---

### Security

For information on reporting security vulnerabilities in Nuxed, see [SECURITY.md](SECURITY.md).

---

### License

Nuxed is open-sourced software licensed under the MIT-licensed.
