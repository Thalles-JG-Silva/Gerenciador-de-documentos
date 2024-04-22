$(document).ready(function(){
    // Esta função é executada quando o DOM está pronto para ser manipulado

    // Função para ativar os itens do menu quando clicados
    $('ul.nav > li').on('click', function(evt) {
        // Quando um item de menu é clicado, esta função é acionada

        // Verifica se o item clicado não possui a classe 'toggle-nav'
        if (!$(this).hasClass('toggle-nav')) {
            // Adiciona a classe 'active' ao item clicado e remove a classe 'active' dos seus irmãos
            $(this).addClass('active').siblings().removeClass('active');
        }
    });

    // Função para adicionar o botão de alternar na barra de navegação
    $('li.toggle-nav').on('click', function() {
        // Quando o botão de alternar é clicado, esta função é acionada

        // Alterna a classe 'rotate-180-deg' no ícone do botão de alternar
        $(this).find('i').toggleClass('rotate-180-deg');

        // Alterna a classe 'hide-link-text' no elemento de navegação lateral
        $('.navbar-nav.side-nav').toggleClass('hide-link-text');

        // Alterna a classe 'expanded' no elemento com o id 'wrapper'
        $('#wrapper').toggleClass('expanded');
    });

    // Função para corrigir o menu ao clicar no botão de hambúrguer
    $('.navbar-toggle').on('click', function() {
        // Quando o botão de hambúrguer é clicado, esta função é acionada

        // Remove a classe 'hide-link-text' do elemento de navegação lateral
        $('.navbar-nav.side-nav').removeClass('hide-link-text');

        // Remove a classe 'expanded' do elemento com o id 'wrapper'
        $('#wrapper').removeClass('expanded');

        // Remove a classe 'rotate-180-deg' do ícone do botão de alternar
        $('i.fa-arrow-left').removeClass('rotate-180-deg');
    });

    // Função para filtrar a tabela com a barra de pesquisa
    $('#searchBox').on('keyup', function() {
        // Quando uma tecla é pressionada no campo de pesquisa, esta função é acionada

        // Obtém o valor digitado no campo de pesquisa e converte para maiúsculas
        var input, filter, table, tr, td, i, txtValue;
        input = this;
        filter = input.value.toUpperCase();

        // Obtém a tabela e suas linhas
        table = document.getElementById("fileList");
        tr = table.getElementsByTagName("tr");

        // Itera sobre todas as linhas da tabela
        for (i = 0; i < tr.length; i++) {
            // Obtém a célula correspondente à segunda coluna da linha
            td = tr[i].getElementsByTagName("td")[1];

            if (td) {
                // Obtém o texto da célula e converte para maiúsculas
                txtValue = td.textContent || td.innerText;

                // Verifica se o texto da célula contém o texto filtrado
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    // Exibe a linha se o texto filtrado for encontrado
                    tr[i].style.display = "";
                } else {
                    // Oculta a linha se o texto filtrado não for encontrado
                    tr[i].style.display = "none";
                }
            }
        }
    });
});
/* Abre as páginas dos botões */
function openpage(pageUrl) {
    // Esta função é chamada quando um botão é clicado para abrir uma página

    // Abre a página especificada no mesmo contexto de navegação
    window.open(pageUrl, '_self');
}

/* Função para excluir um certificado */
function excluirCertificado(event) {
    // Esta função é chamada quando o usuário clica no botão de exclusão de um certificado

    // Exibe uma caixa de diálogo de confirmação
    if (confirm("Tem certeza de que deseja excluir este certificado?")) {
        // Obtém a referência à célula da tabela que contém o botão de exclusão
        var tableCell = event.target.closest("td");
        
        // Obtém a referência à linha da tabela que contém o certificado a ser excluído
        var tableRow = tableCell.closest("tr");
        
        // Remove a linha da tabela
        tableRow.remove();
        
        // Exibe uma mensagem de confirmação
        alert("Certificado excluído com sucesso!");
    }
}

/* Função para imprimir um PDF */
function imprimirPDF(pdfFileName) {
    // Esta função é chamada quando o usuário clica no botão para imprimir um PDF

    // Cria um elemento iframe para carregar o PDF
    var iframe = document.createElement('iframe');
    
    // Define o atributo src do iframe como o nome do arquivo PDF
    iframe.src = pdfFileName;
    
    // Define o estilo do iframe para não ser exibido na página
    iframe.style.display = 'none';
    
    // Adiciona o iframe ao corpo do documento
    document.body.appendChild(iframe);
    
    // Espera um curto período de tempo para o PDF carregar
    setTimeout(function() {
        // Chama a função de impressão do iframe
        iframe.contentWindow.print();
    }, 1000);
}

/* Função para pesquisar certificados */
function searchCertificates() {
    // Esta função é chamada quando o usuário digita algo na barra de pesquisa e pressiona Enter

    // Obtém o valor digitado na barra de pesquisa
    var input = document.getElementById("searchInput");
    var filter = input.value.toUpperCase();

    // Obtém a tabela e as linhas da tabela
    var table = document.querySelector(".panel-body table");
    var rows = table.getElementsByTagName("tr");

    // Itera sobre todas as linhas da tabela
    for (var i = 0; i < rows.length; i++) {
        var cells = rows[i].getElementsByTagName("td");
        var found = false;
        // Itera sobre todas as células da linha
        for (var j = 0; j < cells.length && !found; j++) {
            var cell = cells[j];
            if (cell && cell.textContent) {
                // Obtém o texto da célula e converte para maiúsculas
                var textValue = cell.textContent.toUpperCase();
                // Verifica se o texto da célula contém o texto filtrado
                if (textValue.indexOf(filter) > -1) {
                    found = true;
                }
            }
        }
        // Exibe ou oculta a linha da tabela com base no resultado da pesquisa
        if (found) {
            rows[i].style.display = "";
        } else {
            rows[i].style.display = "none";
        }
    }
}
