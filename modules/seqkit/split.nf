process SEQKIT_SPLIT2 {
  cpus 10
  input:
  tuple val(sample), path(fastq)
  
  output:
  tuple val(sample), path("*.fq.gz")
  
  script:
  
  """
  seqkit \\
    split2 \\
    -p 2 \\
    --threads $task.cpus \\
    $fastq \\
    -O $sample
  mv */*.part_001* camisim_${sample}_R1.fq.gz
  mv */*.part_002* camisim_${sample}_R2.fq.gz
  """
}