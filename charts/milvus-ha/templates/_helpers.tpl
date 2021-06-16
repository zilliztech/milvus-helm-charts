{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "milvus-ha.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "milvus-ha.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified standalone name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "milvus-ha.standalone.fullname" -}}
{{ template "milvus-ha.fullname" . }}-standalone
{{- end -}}

{{/*
Create a default fully qualified Root Coordinator name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "milvus-ha.root-coordinator.fullname" -}}
{{ template "milvus-ha.fullname" . }}-root-coordinator
{{- end -}}

{{/*
Create a default fully qualified proxynode name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "milvus-ha.proxynode.fullname" -}}
{{ template "milvus-ha.fullname" . }}-proxynode
{{- end -}}

{{/*
Create a default fully qualified queryservice name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "milvus-ha.queryservice.fullname" -}}
{{ template "milvus-ha.fullname" . }}-queryservice
{{- end -}}

{{/*
Create a default fully qualified querynode name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "milvus-ha.querynode.fullname" -}}
{{ template "milvus-ha.fullname" . }}-querynode
{{- end -}}

{{/*
Create a default fully qualified Index Coordinator name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "milvus-ha.index-coordinator.fullname" -}}
{{ template "milvus-ha.fullname" . }}-index-coordinator
{{- end -}}

{{/*
Create a default fully qualified indexnode name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "milvus-ha.indexnode.fullname" -}}
{{ template "milvus-ha.fullname" . }}-indexnode
{{- end -}}

{{/*
Create a default fully qualified dataservice name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "milvus-ha.dataservice.fullname" -}}
{{ template "milvus-ha.fullname" . }}-dataservice
{{- end -}}

{{/*
Create a default fully qualified datanode name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "milvus-ha.datanode.fullname" -}}
{{ template "milvus-ha.fullname" . }}-datanode
{{- end -}}

{{/*
Create a default fully qualified pulsar name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "milvus-ha.pulsar.fullname" -}}
{{ template "milvus-ha.fullname" . }}-pulsar
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "milvus-ha.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Helm required labels */}}
{{- define "milvus-ha.labels" -}}
helm.sh/chart: {{ include "milvus-ha.chart" . }}
{{ include "milvus-ha.matchLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/* matchLabels */}}
{{- define "milvus-ha.matchLabels" -}}
app.kubernetes.io/name: {{ include "milvus-ha.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
