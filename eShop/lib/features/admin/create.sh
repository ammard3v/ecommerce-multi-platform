#!/bin/bash

# Ask for base name (this will also be the main folder)
read -p "Enter the project name (this will be the main folder): " project_name

# Check for empty input
if [ -z "$project_name" ]; then
    echo "Project name cannot be empty."
    exit 1
fi

# Create main folder (project folder)
mkdir -p "$project_name"
echo "Project folder '$project_name' created (or already exists)."

# --- Create Data subfolders and files ---
mkdir -p "$project_name/data/source" "$project_name/data/repo" "$project_name/data/model"

touch "$project_name/data/model/${project_name}_model.dart"
touch "$project_name/data/repo/${project_name}_repository_impl.dart"
touch "$project_name/data/source/${project_name}_local_data_source.dart"
touch "$project_name/data/source/${project_name}_remote_data_source.dart"

# --- Create Domain subfolders and files ---
mkdir -p "$project_name/domain/entity" "$project_name/domain/repo" "$project_name/domain/usecase"

touch "$project_name/domain/entity/${project_name}_entity.dart"
touch "$project_name/domain/repo/${project_name}_repository.dart"
touch "$project_name/domain/usecase/${project_name}_usecase.dart"

# --- Create Presentation folder and file ---
mkdir -p "$project_name/presentation"
touch "$project_name/presentation/${project_name}_screen.dart"

echo "Project structure for '$project_name' created successfully!"
