﻿using OpenTK;
using OpenTK.Graphics.OpenGL;

namespace GUI.Types.Renderer
{
    internal class DrawCall
    {
        public PrimitiveType PrimitiveType;
        public Shader Shader;
        public uint BaseVertex;
        public uint VertexCount;
        public uint StartIndex;
        public int IndexCount;
        public uint InstanceIndex;   //TODO
        public uint InstanceCount;   //TODO
        public float UvDensity;     //TODO
        public string Flags;        //TODO
        public Vector3 TintColor = Vector3.One;
        public Material Material;
        public uint VertexArrayObject;
        public DrawBuffer VertexBuffer;
        public DrawElementsType IndiceType;
        public DrawBuffer IndexBuffer;
    }

    internal struct DrawBuffer
    {
        public uint Id;
        public uint Offset;
    }
}
