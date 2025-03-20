configfile: "config.yaml"

rule all:
    input: config["output_file"]

rule process_data:
    input: config["input_file"]
    output: config["output_file"]
    shell:
        "awk '{print $1, $1}' {input} > {output}" 
