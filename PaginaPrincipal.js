
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
/* Abre as paginas dos botoes */
function openpage(pageUrl) {
    window.open(pageUrl, '_self');
}
// botao Excluir// 
function excluirCertificado(event) {
    // Confirmar se o usuário realmente deseja excluir o certificado
    if (confirm("Tem certeza de que deseja excluir este certificado?")) {
        // Obter a referência ao elemento pai do ícone de exclusão (que é a célula da tabela)
        var tableCell = event.target.closest("td");
        
        // Obter a referência à linha (tr) que contém o certificado a ser excluído
        var tableRow = tableCell.closest("tr");
        
        // Remover a linha (tr) da tabela
        tableRow.remove();
        
        // Exibir uma mensagem de confirmação
        alert("Certificado excluído com sucesso!");
    }
}
// imprimir//
function imprimirPDF(pdfFileName) {
    // Criar um elemento iframe
    var iframe = document.createElement('iframe');
    
    // Definir o atributo src do iframe como o nome do arquivo PDF
    iframe.src = pdfFileName;
    
    // Definir o estilo do iframe para não ser exibido na página
    iframe.style.display = 'none';
    
    // Adicionar o iframe ao corpo do documento
    document.body.appendChild(iframe);
    
    // Esperar um curto período de tempo para o PDF carregar
    setTimeout(function() {
        // Chamar a função de impressão do iframe
        iframe.contentWindow.print();
    }, 1000);
}

/*Pesquisa */
function searchCertificates() {
    // Pegar o valor digitado na barra de pesquisa
    var input = document.getElementById("searchInput");
    var filter = input.value.toUpperCase();

    // Pegar a tabela e as linhas da tabela
    var table = document.querySelector(".panel-body table");
    var rows = table.getElementsByTagName("tr");

    // Loop através de todas as linhas da tabela e ocultar aquelas que não correspondem à pesquisa
    for (var i = 0; i < rows.length; i++) {
        var cells = rows[i].getElementsByTagName("td");
        var found = false;
        for (var j = 0; j < cells.length && !found; j++) {
            var cell = cells[j];
            if (cell && cell.textContent) { // Verifica se a célula e seu conteúdo não são nulos
                var textValue = cell.textContent.toUpperCase();
                if (textValue.indexOf(filter) > -1) {
                    found = true;
                }
            }
        }
        // Exibir ou ocultar a linha da tabela com base no resultado da pesquisa
        if (found) {
            rows[i].style.display = "";
        } else {
            rows[i].style.display = "none";
        }
    }
}

