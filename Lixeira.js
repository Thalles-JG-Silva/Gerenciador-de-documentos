document.addEventListener('DOMContentLoaded', function() {
    carregarCertificados();
});

function carregarCertificados() {
    // Aqui você faria uma chamada ao servidor para obter os certificados excluídos
    // Simulação de dados recebidos:
    const certificados = [
        { id: 1, nome: "Certificado de Participação", data: "2021-05-20" },
        { id: 2, nome: "Certificado de Conclusão", data: "2021-06-15" }
    ];

    const lista = document.getElementById('lista-certificados');
    lista.innerHTML = '';
    certificados.forEach(certificado => {
        const item = document.createElement('li');
        item.innerHTML = `
            <span>${certificado.nome} (${certificado.data})</span>
            <div>
                <button onclick="restaurar(${certificado.id})">Restaurar</button>
                <button onclick="excluirPermanente(${certificado.id})">Excluir</button>
            </div>
        `;
        lista.appendChild(item);
    });
}

function restaurar(id) {
    console.log("Restaurar certificado", id);
    // Adicione aqui a lógica para restaurar o certificado
}

function excluirPermanente(id) {
    console.log("Excluir permanentemente o certificado", id);
    // Adicione aqui a lógica para excluir o certificado permanentemente
}

function voltar() {
    window.history.back();
}
