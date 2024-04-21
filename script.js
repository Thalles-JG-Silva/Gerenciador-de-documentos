function searchCertificates() {
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("searchInput");
    filter = input.value.toUpperCase();
    table = document.querySelector("table");
    tr = table.getElementsByTagName("tr");

    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[1]; // Coluna de título do certificado
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }       
    }
}

function toggleAll(source) {
    // Seleciona todos os checkboxes com o nome 'selectedCert' na página
    var checkboxes = document.querySelectorAll('input[type="checkbox"][name="selectedCert"]');
    
    // Itera sobre todos os checkboxes e ajusta o estado de 'checked' de acordo com o checkbox 'source'
    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = source.checked;
    }
}
