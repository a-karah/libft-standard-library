# Standard 42 library ![norminette](https://github.com/a-karah/libft-standard-library/workflows/norminette/badge.svg)

An attempt to recreate standard library implementation in C with compliance to norminette.

## Principles:
- Keep every sub-library separate
- Norminette respected
- Use as minimum external dependency as possible

## Why do such masochism?
I always wondered how thing worked under the hood, and wanted to do something that can keep me busy for a long time as a hobby.

## TODO:
### Add following libraries:
- [x] libft
- [x] ft_printf
- [x] get-next-line
- [ ] dynamic array
- [ ] malloc
- [ ] vector
- [ ] matrix

### Short-term goals:
- [ ] Separate headers to decouple library dependency on each other
- [ ] Compile as a dynamic library
- [ ] Add test framework
- [ ] Add build workflow for macOS and Linux-based platforms

### Long-term goals:
- [ ] All sub-libraries should depend only on syscall functions or be self-reliant
- [ ] Maybe separate sub-libraries as submodules?
