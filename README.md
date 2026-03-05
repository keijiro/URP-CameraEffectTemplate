# URP Camera Effect Template

![screenshot](https://github.com/user-attachments/assets/de314eec-f4a8-420c-9d9f-9258177050c3)

Minimal Unity project for prototyping URP full-screen effects with a
camera-attached controller component.

## Overview

In URP, a custom full-screen effect is typically implemented as a
`Renderer Feature`. The open question is where effect parameters should live.
This project demonstrates a practical pattern based on a camera-attached
controller component, keeping runtime control simple and avoiding asset-side
side effects.

## Common Approaches

There are several common parameter-hosting options, each with tradeoffs.

### 1) Renderer Feature properties

Simple to set up, but not ideal for runtime control. Parameters are harder to
drive from C# or animation.

### 2) Material properties (Full Screen Pass)

Convenient, but changing values often modifies material assets in play mode,
which can leave assets dirty.

### 3) Volume profile properties

Powerful and consistent with post-processing, but introduces extra volume
assets/layers and higher setup/management cost for camera-specific effects.

## Camera-Attached Controller Approach

In my projects, I usually use a **camera-attached controller component**
(`MonoBehaviour`) to hold:

- Shader reference
- Runtime material instance (with proper lifecycle management)
- Serialized effect parameters

This gives you a familiar Unity workflow:

- Easy runtime access from C# and animation
- No project asset modification during play
- Naturally camera-specific behavior

This repository provides a minimal implementation of this pattern as a reusable
template (including AI-assisted workflow use).

## Included Example

Current sample: **Color Invert**.

- `ColorInvertRendererFeature`: renderer feature entry point
- `ColorInvertPass`: render graph pass implementation
- `ColorInvertController`: camera component exposing `Opacity`
- `ColorInvert.shader`: full-screen shader (`1 - src`, blended by opacity)
