---
name: ai-engineering
description: Use when building ML/data systems, designing data pipelines, ETL/ELT processes, data modeling, data quality frameworks, DataOps, or working with Spark, Airflow, dbt, Kafka, Flink, Snowflake, BigQuery, or Delta Lake. Also use for streaming architecture decisions, data contract design, pipeline orchestration, and troubleshooting data infrastructure issues. Also use when optimizing prompts, designing prompt templates, evaluating LLM outputs, building agentic systems, implementing RAG, creating few-shot examples, analyzing token usage, designing AI workflows, or implementing constrained generation with regex, grammars, or Microsoft Guidance-style structured output controls. Also use when designing or analysing controlled experiments (A/B testing, sample sizing, Bonferroni correction), performing causal inference (difference-in-differences), building feature engineering pipelines (Scikit-learn, XGBoost), evaluating classification/regression models (AUC-ROC, AUC-PR, SHAP, MLflow), or translating statistical findings into data-driven business decisions. Also use when building computer vision systems — object detection (YOLO, Faster R-CNN, DETR), image segmentation (Mask R-CNN, SAM, SegFormer), image classification (ResNet, EfficientNet, ViT), video analysis, 3D vision, model optimization (ONNX, TensorRT, OpenVINO), dataset preparation and annotation pipelines, or deploying vision models to production with PyTorch, Ultralytics, Detectron2, or MMDetection.
---

# AI & Data Engineering

Production-grade guidance for data pipelines, ML infrastructure, modern data stack engineering, prompt engineering, constrained generation, and LLM evaluation.

## Start Here

1. Load only the reference files relevant to the current task (see Workflow Router below).
2. For data engineering: choose the processing model first — batch vs. streaming, Lambda vs. Kappa, warehouse vs. lakehouse.
3. For prompt/LLM work: choose the right pattern first — see Prompt Engineering Quick Reference below.
4. For strict output guarantees: prefer hard constraints over prompt-only compliance — use regex, finite selections, or grammar-backed generation when the output must validate deterministically.
5. Use the scripts in `scripts/` for common operations — don't write boilerplate from scratch.
6. Apply DataOps practices by default: data contracts, quality checks, CI/CD gates, and observability.

## Core Rules

- Prefer incremental processing over full reloads. Design for reprocessability from the start.
- Data contracts are first-class citizens — schema, SLAs, and quality guarantees belong in version control.
- Build idempotent pipelines. Running the same pipeline twice must produce the same result.
- Validate data at ingestion, not just at consumption. Catch quality issues at the source boundary.
- Exactly-once semantics are required for financial, compliance, or deduplication-sensitive pipelines.
- Partition strategy is a performance multiplier — choose partition keys based on query patterns, not data shape.
- Dead Letter Queues (DLQs) are mandatory for streaming pipelines. Never silently drop records.
- Observable pipelines emit metrics, lineage events, and freshness signals by default.
- Cost optimization is an engineering concern, not a finance concern. Track and attribute compute spend per pipeline.
- If a response must parse, validate, or match a fixed syntax, prefer constrained generation over plain "return valid JSON" prompting.

## Architecture Decision Framework

### Batch vs. Streaming

| Criteria | Batch | Streaming |
|----------|-------|-----------|
| **Latency** | Hours to days | Seconds to minutes |
| **Volume** | Large historical datasets | Continuous event streams |
| **Complexity** | Complex transforms, ML | Simple aggregations, filtering |
| **Cost** | More cost-effective | Higher infrastructure cost |
| **Error handling** | Easy to reprocess | Requires careful DLQ design |

**Decision tree:**
```
Is real-time insight required?
├── Yes → Use streaming
│   └── Is exactly-once semantics needed?
│       ├── Yes → Kafka + Flink/Spark Structured Streaming
│       └── No → Kafka + consumer groups
└── No → Use batch
    └── Is data volume > 1TB daily?
        ├── Yes → Spark/Databricks
        └── No → dbt + warehouse compute
```

### Lambda vs. Kappa

| Aspect | Lambda | Kappa |
|--------|--------|-------|
| **Complexity** | Two codebases (batch + stream) | Single codebase |
| **Maintenance** | Higher (sync batch/stream logic) | Lower |
| **Reprocessing** | Native batch layer | Replay from source |
| **Use case** | ML training + real-time serving | Pure event-driven |

Choose Lambda when: ML model training on historical data + real-time serving, or existing batch infrastructure.
Choose Kappa when: event-sourced architecture, all processing expressible as stream ops, or starting fresh.

### Warehouse vs. Lakehouse

| Feature | Warehouse (Snowflake/BigQuery) | Lakehouse (Delta/Iceberg) |
|---------|-------------------------------|---------------------------|
| **Best for** | BI, SQL analytics | ML, unstructured data |
| **Storage cost** | Higher (proprietary) | Lower (open formats) |
| **Schema** | Schema-on-write | Schema-on-read |
| **Performance** | Excellent for SQL | Good, improving |

## Tech Stack

| Category | Technologies |
|----------|--------------|
| **Languages** | Python, SQL, Scala |
| **Orchestration** | Airflow, Prefect, Dagster |
| **Transformation** | dbt, Spark, Flink |
| **Streaming** | Kafka, Kinesis, Pub/Sub |
| **Storage** | S3, GCS, Delta Lake, Iceberg |
| **Warehouses** | Snowflake, BigQuery, Redshift, Databricks |
| **Quality** | Great Expectations, dbt tests, Monte Carlo |
| **Monitoring** | Prometheus, Grafana, Datadog |
| **ML/DS** | Scikit-learn, XGBoost, MLflow, SciPy, statsmodels, SHAP |
| **CV Frameworks** | PyTorch, torchvision, timm, Ultralytics (YOLO), Detectron2, MMDetection |
| **CV Tasks** | Object detection, instance/semantic segmentation, classification, tracking |
| **CV Optimization** | ONNX, TensorRT, OpenVINO, CoreML, torch.compile |
| **CV Image Processing** | OpenCV, Pillow, albumentations |
| **CV Annotation** | CVAT, Label Studio, Roboflow |
| **CV Serving** | Triton Inference Server, TorchServe |

## Scripts

```bash
# Generate pipeline orchestration config (Airflow, Prefect, or Dagster)
python scripts/pipeline_orchestrator.py generate \
  --type airflow \
  --source postgres \
  --destination snowflake \
  --schedule "0 5 * * *"

# Validate data quality (schema, freshness, completeness, uniqueness)
python scripts/data_quality_validator.py validate \
  --input data/sales.parquet \
  --schema schemas/sales.json \
  --checks freshness,completeness,uniqueness

# Analyze and optimize ETL performance (SQL, Spark, cost estimation)
python scripts/etl_performance_optimizer.py analyze \
  --query queries/daily_aggregation.sql \
  --engine spark \
  --recommend

# Analyze and optimize a prompt file (token count, clarity score, suggestions)
python scripts/prompt_optimizer.py prompt.txt --analyze

# Generate optimized version of a prompt
python scripts/prompt_optimizer.py prompt.txt --optimize --output optimized.txt

# Evaluate RAG retrieval quality (context relevance, faithfulness, Precision@K)
python scripts/rag_evaluator.py \
  --contexts retrieved.json \
  --questions eval_set.json \
  --output report.json --verbose

# Validate and visualize an agent workflow definition
python scripts/agent_orchestrator.py agent.yaml --validate
python scripts/agent_orchestrator.py agent.yaml --visualize --format mermaid
python scripts/agent_orchestrator.py agent.yaml --estimate-cost --runs 100

# Generate training configuration for YOLO or Faster R-CNN
python scripts/vision_model_trainer.py models/ --task detection --arch yolov8m

# Analyze model for optimization opportunities (quantization, pruning)
python scripts/inference_optimizer.py model.pt --benchmark --recommend --target gpu

# Build dataset pipeline with augmentations and format conversion
python scripts/dataset_pipeline_builder.py analyze --input data/images/
python scripts/dataset_pipeline_builder.py convert --input data/voc/ --output data/coco/ --format coco
python scripts/dataset_pipeline_builder.py split --input data/coco/ --train 0.8 --val 0.1 --test 0.1

# Design an A/B experiment (sample size calculation)
python scripts/experiment_designer.py --input experiment_spec.json --output experiment_plan.json

# Run feature engineering pipeline on a dataset
python scripts/feature_engineering_pipeline.py --input raw_data.csv --output features.parquet

# Evaluate a trained model with cross-validation and MLflow logging
python scripts/model_evaluation_suite.py --input features.parquet --config eval_config.yaml
```

## Prompt Engineering Quick Reference

| Pattern | When to Use | Example |
|---------|-------------|---------|
| **Zero-shot** | Simple, well-defined tasks | "Classify this email as spam or not spam" |
| **Few-shot** | Complex tasks, consistent format needed | Provide 3–5 diverse Input/Output examples |
| **Chain-of-Thought** | Reasoning, math, multi-step logic | "Think step by step..." |
| **Role Prompting** | Expertise needed, specific perspective | "You are an expert tax accountant..." |
| **Structured Output** | Need parseable JSON/XML | Include schema + "Respond ONLY with valid JSON" |
| **Constrained Generation** | Output must match exact syntax or enumerated choices | Guidance with `regex`, `select`, or grammar-backed fields |
| **Self-Consistency** | High-stakes decisions | Run N times at temp > 0, majority-vote the answer |
| **ReAct** | Tool use required | Thought → Action → Observation loop |
| **Tree of Thoughts** | Complex problem solving | Generate 3 approaches, evaluate, pick best |
| **RAG** | Factual Q&A, current information | "Use the following context... If not in context, say so." |
| **Meta-Prompting** | Prompt generation | Ask the model to generate an optimized prompt |

## Computer Vision Quick Reference

### Detection Architecture Selection

| Requirement | Recommended | Why |
|-------------|-------------|-----|
| Real-time (>30 FPS) | YOLOv8s/m, RT-DETR | Single-stage, optimized for speed |
| Maximum accuracy | DINO, Cascade R-CNN | Multi-scale transformer / two-stage refinement |
| Edge (<4GB RAM) | YOLOv8n, MobileNetV3-SSD | Lightweight architectures |
| Small objects | YOLO + SAHI, Faster R-CNN + P2 | Multi-scale tiling or deeper FPN |
| No NMS required | DETR, RT-DETR | Set-based loss, end-to-end |
| Instance segmentation | Mask R-CNN, YOLOv8-seg | Mask head on top of detection |
| Zero-shot segmentation | SAM | Promptable, no retraining |

### Deployment Optimization Path

| Target | Path |
|--------|------|
| NVIDIA GPU (cloud) | PyTorch → ONNX → TensorRT FP16 (2–4× speedup) |
| NVIDIA GPU (edge) | PyTorch → TensorRT INT8 (3–6× speedup) |
| Intel CPU | PyTorch → ONNX → OpenVINO (1.5–3×) |
| Apple Silicon | PyTorch → CoreML (2–5×) |
| Generic CPU | PyTorch → ONNX Runtime (1.2–2×) |
| Mobile | PyTorch → TFLite or ONNX Mobile |

### Key CV Metrics

| Metric | Good Target | Description |
|--------|------------|-------------|
| mAP@50 | >0.7 | Mean AP at IoU 0.5 |
| mAP@50:95 | >0.5 | COCO primary metric |
| Inference latency P99 | <50ms real-time, <150ms high-accuracy | End-to-end |
| Model size | <50MB edge, <200MB server | Post-optimization |

## Workflow Router

### Pipeline architecture (Lambda, Kappa, Medallion, Spark, Kafka)

Read [data-pipeline-architecture.md](./references/data-pipeline-architecture.md) when designing or implementing data pipeline architecture — choosing between Lambda/Kappa/Medallion patterns, configuring Spark batch jobs (memory, partitions, joins, caching), setting up Kafka topics and consumer groups, implementing exactly-once semantics, handling late-arriving data with watermarks, using CDC or bulk ingestion patterns, or implementing Dead Letter Queue and Circuit Breaker error handling.

### Data modeling (dimensional, Data Vault, SCD, dbt, partitioning)

Read [data-modeling-patterns.md](./references/data-modeling-patterns.md) when designing data models — choosing between Star/Snowflake schema, One Big Table, or Data Vault; implementing Slowly Changing Dimensions (Types 0–6); writing dbt models with incremental materialization; choosing partition and clustering keys for BigQuery, Snowflake, or Delta Lake; or managing schema evolution and data contracts for breaking changes.

### DataOps (testing, contracts, CI/CD, observability, cost)

Read [dataops-best-practices.md](./references/dataops-best-practices.md) for production data operations — setting up Great Expectations or dbt test suites, authoring data contracts with SLAs, wiring GitHub Actions CI/CD for data pipelines, emitting OpenLineage events for data lineage, configuring Prometheus alerting for freshness and quality degradation, running incident response runbooks, or optimizing Snowflake/BigQuery compute costs.

### End-to-end workflows (batch ETL, real-time streaming, quality framework)

Read [data-workflows.md](./references/data-workflows.md) for complete production-ready implementations:
- Batch ETL Pipeline (PostgreSQL → dbt → Snowflake with Airflow orchestration)
- Real-Time Streaming (Kafka → Spark Structured Streaming → Delta Lake)
- Data Quality Framework (Great Expectations + dbt tests + data contracts)

### Troubleshooting (Airflow, Spark, Kafka, duplicates, schema drift, slow queries)

Read [data-troubleshooting.md](./references/data-troubleshooting.md) for diagnosed fixes:
- Airflow DAG timeouts and Spark memory exhaustion
- Kafka consumer lag growth
- Duplicate records and stale data detection
- Schema drift and structural change handling
- Slow queries (partition pruning, join optimization, dbt incremental strategies)

### Prompt engineering (patterns, few-shot, chain-of-thought, role prompting, structured output)

Read [prompt-engineering-patterns.md](./references/prompt-engineering-patterns.md) when writing or improving prompts — choosing between zero-shot, few-shot, chain-of-thought, role prompting, structured output, self-consistency, ReAct, tree-of-thoughts, RAG, or meta-prompting patterns. Includes input/output examples for each pattern and a pattern selection guide.

### Constrained generation with Guidance (regex, select, grammar-backed output)

Read [guidance-constrained-generation.md](./references/guidance-constrained-generation.md) when prompt-only formatting is too weak — implementing regex-constrained fields, finite-choice routing with `select`, grammar-backed JSON/code generation, Guidance functions with `@guidance`, token-healing-aware output control, backend setup for OpenAI/Anthropic/local models, or multi-step constrained workflows.

### LLM evaluation (metrics, A/B testing, RAG evaluation, benchmarks)

Read [llm-evaluation-frameworks.md](./references/llm-evaluation-frameworks.md) when measuring or comparing LLM output quality — choosing between BLEU, ROUGE, BERTScore, or semantic metrics; implementing human evaluation (Likert, side-by-side, LLM-as-judge); designing A/B tests for prompts; using benchmark datasets (MMLU, HumanEval, GSM8K); evaluating RAG context relevance and answer faithfulness; or designing automated evaluation pipelines.

### Agentic system design (ReAct, Plan-Execute, tool calling, multi-agent, memory)

Read [agentic-system-design.md](./references/agentic-system-design.md) when designing or implementing agent architectures — ReAct (thought/action/observation loop), Plan-and-Execute (two-phase planning), tool use / function calling with ToolRegistry, multi-agent collaboration (sequential, hierarchical, debate patterns), memory and state management (working/episodic/semantic), or agent design patterns (reflection, self-ask, expert routing).

### Statistical modeling & experiments (A/B testing, sample sizing, causal inference, DiD)

Read [statistical-modeling-experiments.md](./references/statistical-modeling-experiments.md) when designing or analyzing controlled experiments — calculating sample size, running two-proportion z-tests, applying Bonferroni or FDR corrections for multiple metrics, detecting sample ratio mismatch, or estimating causal effects via Difference-in-Differences. Includes Python implementations for `calculate_sample_size`, `analyze_experiment`, `diff_in_diff`, and multiple-testing corrections.

### Feature engineering for ML (Scikit-learn pipelines, encoding, leakage prevention)

Read [feature-engineering-ml.md](./references/feature-engineering-ml.md) when building feature pipelines — constructing Scikit-learn `ColumnTransformer` pipelines, choosing encoding strategies by cardinality, extracting cyclical time features, preventing train/test leakage, selecting features with SHAP, or applying transformations (log, winsorizing, binning, interactions).

### Model evaluation & selection (cross-validation, AUC-ROC, AUC-PR, MLflow, SHAP, calibration)

Read [model-evaluation.md](./references/model-evaluation.md) when training and evaluating classification or regression models — choosing between AUC-ROC and AUC-PR for imbalanced datasets, cross-validating with `StratifiedKFold`, detecting overfitting via train/validation gap, logging experiments to MLflow, explaining predictions with SHAP, calibrating predicted probabilities, or configuring XGBoost for production.

### Computer vision architectures (CNN, ViT, YOLO, Faster R-CNN, DETR, FPN, segmentation)

Read [computer_vision_architectures.md](./references/computer_vision_architectures.md) when selecting or implementing vision model architectures — comparing ResNet/EfficientNet/ConvNeXt backbones, choosing between YOLO variants (v5–v11) and two-stage detectors (Faster R-CNN, Cascade R-CNN), implementing transformer-based detection (DETR, DINO, RT-DETR), selecting segmentation architectures (Mask R-CNN, YOLOv8-seg, SAM, SegFormer, DeepLabV3+), understanding FPN/PANet/BiFPN neck designs, or reviewing CNN vs Vision Transformer trade-offs.

### Object detection optimization (NMS, anchors, loss functions, training strategies, augmentation)

Read [object_detection_optimization.md](./references/object_detection_optimization.md) when optimizing a detection model — choosing NMS variant (standard, Soft-NMS, DIoU-NMS), designing or clustering anchor boxes, selecting regression loss (IoU/GIoU/DIoU/CIoU/DFL), applying training strategies (warmup, cosine annealing, EMA, multi-scale training, mixed precision), configuring data augmentations (mosaic, mixup, copy-paste, cutout), applying pruning or quantization, or tuning hyperparameters with Optuna.

### Production vision systems (ONNX, TensorRT, edge deployment, serving, video pipelines)

Read [production_vision_systems.md](./references/production_vision_systems.md) when deploying a vision model to production — exporting to ONNX and optimizing the graph, converting to TensorRT (FP16/INT8), deploying with ONNX Runtime, targeting edge devices (Jetson, Intel NCS, Raspberry Pi), serving with Triton Inference Server or TorchServe, building real-time video processing pipelines with object tracking (ByteTrack), setting up monitoring and observability for vision services, or scaling inference with batching and async workers.
