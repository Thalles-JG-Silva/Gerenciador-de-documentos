function voltar() {
    window.history.back(); // Simula um clique no botão 'voltar' do navegador
}

function restaurarSelecionados() {
    const selecionados = document.querySelectorAll('input[name="selectedCert"]:checked');
    selecionados.forEach(checkbox => {
        // Adicione lógica para restaurar o certificado
        console.log('Restaurando: ', checkbox.value);
    });
    // Recarregar a página ou atualizar a tabela
}

function excluirPermanenteSelecionados() {
    const selecionados = document.querySelectorAll('input[name="selectedCert"]:checked');
    selecionados.forEach(checkbox => {
        // Adicione lógica para excluir permanentemente o certificado
        console.log('Excluindo permanentemente: ', checkbox.value);
    });
    // Recarregar a página ou atualizar a tabela
}
