# VDJ-Insights

Docker container for [VDJ-Insights](https://github.com/BPRC-Bioinfo/VDJ-Insights), a Python package for annotating immunoglobulin and T cell receptor genomic regions.

## Upstream

- Upstream repo: https://github.com/BPRC-Bioinfo/VDJ-Insights
- Paper: *VDJ-Insights: simplifying the annotation of genomic immunoglobulin and T cell receptor regions*, Bioinformatics 42(4), btag108, 2026. https://doi.org/10.1093/bioinformatics/btag108

## Image

```bash
docker pull picotainers/vdj-insights:latest
```

## Usage

```bash
docker run --rm \
  -v "$PWD:/work" \
  picotainers/vdj-insights:latest \
  annotation \
  -a /work/assembly.fasta \
  -r IG \
  -s "Homo sapiens" \
  -o /work/output
```

For the web report:

```bash
docker run --rm \
  -v "$PWD:/work" \
  picotainers/vdj-insights:latest \
  html \
  -i /work/output
```

## Runtime notes

- The tool creates a local conda environment under `.tool/conda/vdj-insights_env` on first use.
- Keep the working directory writable so the tool can store its caches and temporary files.
- Annotation and report generation may download reference data from IMGT and conda channels at runtime.
