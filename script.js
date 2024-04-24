/**
 * Filtra os certificados na tabela com base no texto inserido pelo usuário no campo de pesquisa.
 */
function searchCertificates() {
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("searchInput"); // Obtém o elemento input de pesquisa
    filter = input.value.toUpperCase(); // Transforma o texto de entrada em maiúsculas para insensibilidade a maiúsculas/minúsculas
    table = document.querySelector("table"); // Seleciona a primeira tabela encontrada no documento
    tr = table.getElementsByTagName("tr"); // Obtém todos os elementos 'tr' (linhas) da tabela

    // Itera sobre cada linha da tabela
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[1]; // Obtém a segunda célula (td) de cada linha, assumindo que é a coluna do título
        if (td) {
            txtValue = td.textContent || td.innerText; // Obtém o texto dentro da célula
            // Verifica se o texto contém a string de pesquisa
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = ""; // Mostra a linha se corresponder ao filtro
            } else {
                tr[i].style.display = "none"; // Oculta a linha se não corresponder
            }
        }       
    }
}

/**
 * Marca ou desmarca todos os checkboxes de certificados baseado no checkbox 'source'.
 * @param {HTMLInputElement} source - O checkbox que controla todos os outros.
 */
function toggleAll(source) {
    var checkboxes = document.querySelectorAll('input[type="checkbox"][name="selectedCert"]'); // Seleciona todos os checkboxes dos certificados
    
    // Define o estado de cada checkbox para corresponder ao estado do checkbox fonte (marcar ou desmarcar todos)
    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = source.checked;
    }
}

/**
 * Função para imprimir um arquivo PDF especificado pelo nome do arquivo.
 * @param {string} pdfFileName - O nome do arquivo PDF a ser impresso.
 */
function imprimirPDF(pdfFileName) {
    // Cria um novo elemento iframe dinamicamente.
    var iframe = document.createElement('iframe');
    // Define o atributo src do iframe para o nome do arquivo PDF fornecido, que indica o caminho do arquivo a ser carregado.
    iframe.src = pdfFileName;

    // Define o estilo do iframe para 'none' para ocultá-lo visualmente na página, mas ainda presente no DOM.
    iframe.style.display = 'none';

    // Adiciona o iframe ao corpo do documento HTML. Isso é necessário para que o iframe seja considerado parte da página e tenha conteúdo carregável.
    document.body.appendChild(iframe);

    // Configura um temporizador para atrasar a execução da função de impressão.
    setTimeout(function() {
        // Acessa a janela do conteúdo do iframe e chama o método print().
        // Este método abre a caixa de diálogo de impressão para o conteúdo atualmente exibido no iframe.
        iframe.contentWindow.print();
    }, 1000); // O atraso de 1000 milissegundos (1 segundo) garante que o PDF tenha tempo suficiente para carregar completamente antes de tentar imprimir.
}


/**
 * Abre um certificado em uma nova janela pop-up com especificações definidas.
 */
function openCertificate() {
    var url = 'Certificado Teste.pdf'; // URL do arquivo PDF
    var windowFeatures = 'width=800,height=600,resizable=yes,scrollbars=yes,status=yes'; // Características da janela pop-up
    window.open(url, '_blank', windowFeatures); // Abre o PDF em uma nova janela com as características especificadas
}
