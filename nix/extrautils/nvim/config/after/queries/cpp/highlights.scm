; extends

; C++20 module declarations are parsed by tree-sitter-cpp but are not covered
; by the upstream C++ highlight query.
(global_module_fragment_declaration "module" @keyword)
(module_declaration "export" @keyword)
(module_declaration "module" @keyword)
(private_module_fragment_declaration "module" @keyword)
(import_declaration "import" @keyword)
(export_declaration "export" @keyword)

; This also covers module partitions, including `example:part` and `:part`.
(module_name) @module
