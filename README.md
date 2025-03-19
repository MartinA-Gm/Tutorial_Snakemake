# Tutorial_Snakemake
This repository contains wikis and tutorials on how to use snakemake

# Snakemake Tutorial - Getting Started

This tutorial provides a step-by-step guide to create a simple Snakemake workflow. Snakemake is a workflow management tool that helps organize and automate complex data analyses.

## 1. Project Structure
Create a project folder with the following structure:
```
my_project/
│── data/
│   └── input.txt
│── Snakefile
│── config.yaml
```
- `data/`: Stores input data files.
- `Snakefile`: The main file where you define rules.
- `config.yaml`: Configuration file for customizable parameters.

## 2. Example Input Data
Create a simple text file `data/input.txt`:
```
A
B
C
```

## 3. Writing the Snakefile
Edit the `Snakefile` with the following content:
```python
rule all:
    input: "data/output.txt"

rule process_data:
    input: "data/input.txt"
    output: "data/output.txt"
    shell:
        "awk '{print $1, $1}' {input} > {output}"
```
- `rule all`: Defines the final target of the workflow.
- `rule process_data`: Reads `data/input.txt` and writes to `data/output.txt` using the `awk` command.

## 4. Configuration File (Optional)
You can add a `config.yaml` for customizable parameters:
```yaml
input_file: "data/input.txt"
output_file: "data/output.txt"
```
Modify the `Snakefile` to use the configuration:
```python
configfile: "config.yaml"

rule all:
    input: config["output_file"]

rule process_data:
    input: config["input_file"]
    output: config["output_file"]
    shell:
        "awk '{print $1, $1}' {input} > {output}"
```

## 5. Running the Workflow
- Navigate to your project directory: `cd my_project`
- Execute the workflow with:  
```
snakemake -j1
```
The `-j1` flag specifies a single core. Adjust based on your resources.

## 6. Useful Snakemake Commands
- Dry run: `snakemake -n` to check the workflow without running.
- Detailed log: `snakemake -p` to display executed shell commands.
- Visualize DAG: `snakemake --dag | dot -Tpng > dag.png`

## Conclusion
You've successfully created a simple Snakemake workflow! This example can serve as a basis for more complex projects. If you need more advanced features, feel free to expand and customize!

