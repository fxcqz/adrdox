LIBDPARSE=Dscanner/libdparse/src/dparse/ast.d Dscanner/libdparse/src/dparse/formatter.d Dscanner/libdparse/src/dparse/parser.d Dscanner/libdparse/src/dparse/entities.d  Dscanner/libdparse/src/dparse/lexer.d Dscanner/libdparse/src/std/experimental/lexer.d ./Dscanner/libdparse/experimental_allocator/src/std/experimental/allocator/building_blocks/stats_collector.d ./Dscanner/libdparse/experimental_allocator/src/std/experimental/allocator/building_blocks/fallback_allocator.d ./Dscanner/libdparse/experimental_allocator/src/std/experimental/allocator/building_blocks/bucketizer.d ./Dscanner/libdparse/experimental_allocator/src/std/experimental/allocator/building_blocks/affix_allocator.d ./Dscanner/libdparse/experimental_allocator/src/std/experimental/allocator/building_blocks/quantizer.d ./Dscanner/libdparse/experimental_allocator/src/std/experimental/allocator/building_blocks/package.d ./Dscanner/libdparse/experimental_allocator/src/std/experimental/allocator/building_blocks/region.d ./Dscanner/libdparse/experimental_allocator/src/std/experimental/allocator/building_blocks/bitmapped_block.d ./Dscanner/libdparse/experimental_allocator/src/std/experimental/allocator/building_blocks/segregator.d ./Dscanner/libdparse/experimental_allocator/src/std/experimental/allocator/building_blocks/scoped_allocator.d ./Dscanner/libdparse/experimental_allocator/src/std/experimental/allocator/building_blocks/free_tree.d ./Dscanner/libdparse/experimental_allocator/src/std/experimental/allocator/building_blocks/kernighan_ritchie.d ./Dscanner/libdparse/experimental_allocator/src/std/experimental/allocator/building_blocks/free_list.d ./Dscanner/libdparse/experimental_allocator/src/std/experimental/allocator/building_blocks/null_allocator.d ./Dscanner/libdparse/experimental_allocator/src/std/experimental/allocator/building_blocks/allocator_list.d ./Dscanner/libdparse/experimental_allocator/src/std/experimental/allocator/typed.d ./Dscanner/libdparse/experimental_allocator/src/std/experimental/allocator/mmap_allocator.d ./Dscanner/libdparse/experimental_allocator/src/std/experimental/allocator/package.d ./Dscanner/libdparse/experimental_allocator/src/std/experimental/allocator/common.d ./Dscanner/libdparse/experimental_allocator/src/std/experimental/allocator/mallocator.d ./Dscanner/libdparse/experimental_allocator/src/std/experimental/allocator/gc_allocator.d # ./Dscanner/libdparse/src/dparse/rollback_allocator.d ./Dscanner/libdparse/src/dparse/stack_buffer.d

all:
	#dmd diff.d terminal.d $(LIBDPARSE)
	dmd -m64 doc2.d latex.d cgi.d comment.d stemmer.d dom.d script.d jsvar.d html.d color.d -J. $(LIBDPARSE) -g # -version=std_parser_verbose 
	#dmd -of/var/www/dpldocs.info/locate locate.d  dom.d stemmer.d  cgi -J. -version=fastcgi -m64 -debug
locate:
	dmd -of/var/www/dpldocs.info/locate locate.d  dom.d stemmer.d  cgi -J. -version=fastcgi -m64 -debug

vps_locate:
	ldc2 -oq -O3 -m64 locate.d  dom.d stemmer.d  cgi -J. -d-version=scgi -d-version=vps -g

ldc:
	ldc2 -oq -O3 -m64 doc2.d latex.d cgi.d comment.d stemmer.d dom.d script.d jsvar.d html.d color.d -J. $(LIBDPARSE) -g # -version=std_parser_verbose 

http:
	dmd -debug -ofserver -version=embedded_httpd -version=with_http_server -m64 doc2.d latex.d cgi.d comment.d stemmer.d dom.d script.d jsvar.d html.d color.d -J. $(LIBDPARSE) -g # -version=std_parser_verbose 
