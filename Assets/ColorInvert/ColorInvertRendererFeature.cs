using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;

namespace URPCameraEffect {

public sealed class ColorInvertRendererFeature : ScriptableRendererFeature
{
    [SerializeField]
    RenderPassEvent _passEvent = RenderPassEvent.AfterRenderingPostProcessing;

    ColorInvertPass _pass;

    public override void Create()
      => _pass = new ColorInvertPass { renderPassEvent = _passEvent };

    public override void AddRenderPasses
      (ScriptableRenderer renderer, ref RenderingData renderingData)
      => renderer.EnqueuePass(_pass);
}

} // namespace URPCameraEffect
