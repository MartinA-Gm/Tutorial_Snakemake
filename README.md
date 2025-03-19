# Welcome to the Snakemake Tutorial 🚀

This repository provides a step-by-step guide to creating a simple Snakemake workflow. Snakemake is a powerful workflow management tool, widely used for organizing and automating data analysis pipelines, especially in bioinformatics.

> Please go check the wikis of this repository, they contains many useful informations. [Wikis](https://github.com/MartinA-Gm/Tutorial_Snakemake/wiki)

## 📁 Project Structure
Make sure your project folder follows this structure:
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

## 📝 Example Input Data
Create a simple text file `data/input.txt`:
```
A
B
C
```

## 🛠️ Writing the Snakefile
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

## 🔧 Configuration File (Optional)
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

## ▶️ Running the Workflow
- Navigate to your project directory: `cd my_project`
- Execute the workflow with:  
```
snakemake -j1
```
The `-j1` flag specifies a single core. Adjust based on your resources.

## 🔍 Useful Snakemake Commands
- **Dry run:** `snakemake -n` to check the workflow without running.
- **Detailed log:** `snakemake -p` to display executed shell commands.
- **Visualize DAG:** `snakemake --dag | dot -Tpng > dag.png`

## 🎯 Conclusion
You've successfully created a simple Snakemake workflow! This example is a solid starting point for more advanced projects. Feel free to expand and adjust it based on your needs!

If you find this tutorial helpful, consider giving the repository a ⭐!

