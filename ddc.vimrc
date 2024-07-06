" From ddc-examples
" Customize global settings

" You must set the default ui.
" NOTE: native ui
" https://github.com/Shougo/ddc-ui-native
call ddc#custom#patch_global('ui', 'native')

" Use around source.
" https://github.com/Shougo/ddc-source-around
call ddc#custom#patch_global('sources', ['around'])

" Use matcher_head and sorter_rank.
" https://github.com/Shougo/ddc-matcher_head
" https://github.com/Shougo/ddc-sorter_rank
call ddc#custom#patch_global('sourceOptions', {
      \   '_': {
      \     'matchers': ['matcher_head'],
      \     'sorters': ['sorter_rank']},
      \   },
      \ )

" Change source options
call ddc#custom#patch_global('sourceOptions', {
      \   'around': { 'mark': 'A' },
      \ })
call ddc#custom#patch_global('sourceParams', {
      \   'around': { 'maxSize': 500 },
      \ })

" Customize settings on a filetype
call ddc#custom#patch_filetype(
    \   ['c', 'cpp'], 'sources', ['around', 'clangd']
    \ )
call ddc#custom#patch_filetype(['c', 'cpp'], 'sourceOptions', {
    \   'clangd': { 'mark': 'C' },
    \ })
call ddc#custom#patch_filetype('markdown', 'sourceParams', {
    \   'around': { 'maxSize': 100 },
    \ })

" " Mappings
"
" " <TAB>: completion.
" " NOTE: It does not work for pum.vim
" inoremap <expr> <TAB>
" \ pumvisible() ? '<C-n>' :
" \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
" \ '<TAB>' : ddc#map#manual_complete()
"
" " <S-TAB>: completion back.
" " NOTE: It does not work for pum.vim
" inoremap <expr> <S-TAB>  pumvisible() ? '<C-p>' : '<C-h>'

" Use ddc.
call ddc#enable()
" End ddc-examples

" From ddc-file
call ddc#custom#patch_global('sources', ['file'])
call ddc#custom#patch_global('sourceOptions', {
    \ 'file': {
    \   'mark': 'F',
    \   'isVolatile': v:true,
    \   'forceCompletionPattern': '\S/\S*',
    \ }})
call ddc#custom#patch_filetype(
    \ ['ps1', 'dosbatch', 'autohotkey', 'registry'], {
    \ 'sourceOptions': {
    \   'file': {
    \     'forceCompletionPattern': '\S\\\S*',
    \   },
    \ },
    \ 'sourceParams': {
    \   'file': {
    \     'mode': 'win32',
    \   },
    \ }})
" End ddc-file
" " From ddc-source-lsp
" call ddc#custom#patch_global('sources', ['lsp'])
" call ddc#custom#patch_global('sourceOptions', #{
"             \   lsp: #{
"             \     mark: 'lsp',
"             \     forceCompletionPattern: '\.\w*|:\w*|->\w*',
"             \   },
"             \ })
"
" call ddc#custom#patch_global('sourceParams', #{
"             \   lsp: #{
"             \     snippetEngine: denops#callback#register({
"             \           body -> vsnip#anonymous(body)
"             \     }),
"             \     enableResolveItem: v:true,
"             \     enableAdditionalTextEdit: v:true,
"             \   }
"             \ })
" " End ddc-source-lsp

" " ui で何を使用するか指定
" call ddc#custom#patch_global('ui', 'native')
"
" " 補完内容を管理
" call ddc#custom#patch_global('sources', ['around'])
"
" " 保管時のオプションを管理
" call ddc#custom#patch_global('sourceOptions', {
"       \ '_': {
"       \   'matchers': ['matcher_head'],
"       \   'sorters': ['sorter_rank']},
"       \ })
"
" " ddc を有効化！
" call ddc#enable()

