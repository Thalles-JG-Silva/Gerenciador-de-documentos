function salvar() {
    // Implemente a lógica para salvar o certificado aqui.
    alert('Certificado salvo com sucesso!');
  }
  
  function cancelar() {
    // Limpar formulário ou fechar modal.
    document.getElementById("certificadoForm").reset();
    alert('Operação cancelada.');
  }

  function mascaraCPF() {
    var cpf = document.getElementById('cpf');
    var valor = cpf.value;
  
    // Remove qualquer caracter não numérico incluindo espaços
    valor = valor.replace(/\D/g, '');
  
    // Adiciona os pontos e hífen
    valor = valor.replace(/(\d{3})(\d)/, '$1.$2');
    valor = valor.replace(/(\d{3})(\d)/, '$1.$2');
    valor = valor.replace(/(\d{3})(\d{1,2})$/, '$1-$2');
  
    // Atualiza o valor no campo
    cpf.value = valor;
  }
  
  