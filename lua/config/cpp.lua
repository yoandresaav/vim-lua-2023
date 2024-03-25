-- Set the C++ compiler for syntastic
vim.g.syntastic_cpp_compiler = 'clang++'

-- Set compiler options (including C++ standard)
vim.g.syntastic_cpp_compiler_options = ' -std=c++11'


vim.g.syntastic_cpp_checkers = {'clang', 'gcc'}
