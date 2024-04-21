
        $(document).ready(function(){
            // Função para ativar os itens do menu
            $('ul.nav > li').on('click', function(evt) {
                if (!$(this).hasClass('toggle-nav')) {
                    $(this).addClass('active').siblings().removeClass('active');
                }
            });

            // Função para adicionar o botão de alternar
            $('li.toggle-nav').on('click', function() {
                $(this).find('i').toggleClass('rotate-180-deg');
                $('.navbar-nav.side-nav').toggleClass('hide-link-text');
                $('#wrapper').toggleClass('expanded');
            });

            // Função para corrigir o menu ao clicar no botão de hambúrguer
            $('.navbar-toggle').on('click', function() {
                $('.navbar-nav.side-nav').removeClass('hide-link-text');
                $('#wrapper').removeClass('expanded');
                $('i.fa-arrow-left').removeClass('rotate-180-deg');
            });

            // Função para filtrar a tabela com a barra de pesquisa
            $('#searchBox').on('keyup', function() {
                var input, filter, table, tr, td, i, txtValue;
                input = this;
                filter = input.value.toUpperCase();
                table = document.getElementById("fileList");
                tr = table.getElementsByTagName("tr");
                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[1];
                    if (td) {
                        txtValue = td.textContent || td.innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }
            });
        });
