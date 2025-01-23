#!/bin/bash

OUTPUT_DIR="/home/runner/.datree/crdSchemas"
INDEX_FILE="$OUTPUT_DIR/index.html"

# Check if the directory contains files
if [[ ! -d "$OUTPUT_DIR" ]] || [[ -z "$(ls -A "$OUTPUT_DIR" | grep -v 'index.html')" ]]; then
    echo "No CRD schema files found in $OUTPUT_DIR"
    exit 1
fi

# Start HTML file
cat > "$INDEX_FILE" <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kubernetes CRD Schemas</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        h1 { color: #333; }
        ul { list-style-type: none; padding: 0; }
        li { margin: 5px 0; }
        a { text-decoration: none; color: #007bff; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <h1>Available Kubernetes CRD Schemas</h1>
    <ul>
EOF

# Generate file list, excluding index.html
for file in "$OUTPUT_DIR"/*; do
    if [[ -f "$file" && "$(basename "$file")" != "index.html" ]]; then
        filename=$(basename "$file")
        echo "        <li><a href=\"$filename\">$filename</a></li>" >> "$INDEX_FILE"
    fi
done

# Close HTML tags
cat >> "$INDEX_FILE" <<EOF
    </ul>
</body>
</html>
EOF

echo "Generated index.html in $OUTPUT_DIR"
