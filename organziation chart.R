library(DiagrammeR)

grViz("digraph DonorPolicy {
  
  rankdir=TB;
  fontname='Helvetica';
  
  // Global styles
  node [fontname='Helvetica', shape=box, style=rounded];
  edge [fontname='Helvetica'];
  
  // Decision nodes
  family [label='Donatore familiare disponibile?'];
  hla_id [label='Familiare HLA-identico?'];
  haplo  [label='Familiare aploidentico?'];
  mud1010 [label='Donatore MUD 10/10?'];
  
  // Action nodes
  activate_mud [
    label='Attivazione ricerca MUD',
    fillcolor='#FFF2CC',
    style='rounded,filled'
  ];
  
  evaluate_apheresis [
    label='Valutazione unità aferesi',
    fillcolor='#FFF2CC',
    style='rounded,filled'
  ];
  
  // Outcome nodes
  tx_haplo [
    label='Trapianto aploidentico',
    style='dashed'
  ];
  
  tx_mud [
    label='Trapianto MUD',
    style='dashed'
  ];
  
  tx_best_mud [
    label='Trapianto con miglior donatore MUD disponibile',
    style='dashed'
  ];
  
  // Flow
  family -> hla_id [label='Sì'];
  family -> activate_mud [label='  No'];
  
  hla_id -> evaluate_apheresis [label='Sì'];
  hla_id -> haplo [taillabel='No', labeldistance=2.5, labelangle=-45];
  
  haplo -> evaluate_apheresis [label='Sì'];
  haplo -> activate_mud [label='No'];
  
  activate_mud -> tx_best_mud;
  
  evaluate_apheresis -> mud1010;
  
  mud1010 -> tx_mud [label='Sì'];
  mud1010 -> tx_haplo [label='No'];
}")
