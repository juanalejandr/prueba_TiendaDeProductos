using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace productosDeTienda.Models
{
    public partial class tiendaContext : DbContext
    {
        public tiendaContext()
        {
        }

        public tiendaContext(DbContextOptions<tiendaContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Categorium> Categoria { get; set; } = null!;
        public virtual DbSet<Producto> Productos { get; set; } = null!;
        public virtual DbSet<Usuario> Usuarios { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=(local); DataBase=tienda;Integrated Security=true");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Categorium>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("categoria");

                entity.Property(e => e.Descripcion)
                    .IsUnicode(false)
                    .HasColumnName("descripcion");

                entity.Property(e => e.IdCategoria)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("id_categoria");
            });

            modelBuilder.Entity<Producto>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("productos");

                entity.Property(e => e.Categoria).HasColumnName("categoria");

                entity.Property(e => e.Descripcion)
                    .IsUnicode(false)
                    .HasColumnName("descripcion");

                entity.Property(e => e.Foto).HasColumnName("foto");

                entity.Property(e => e.IdProduct)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("id_product");

                entity.Property(e => e.Marca)
                    .IsUnicode(false)
                    .HasColumnName("marca");

                entity.Property(e => e.Nombre)
                    .IsUnicode(false)
                    .HasColumnName("nombre");

                entity.Property(e => e.Precio)
                    .HasColumnType("decimal(18, 2)")
                    .HasColumnName("precio");
            });

            modelBuilder.Entity<Usuario>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("usuario");

                entity.Property(e => e.Apellido)
                    .IsUnicode(false)
                    .HasColumnName("apellido");

                entity.Property(e => e.Clave)
                    .HasMaxLength(100)
                    .IsUnicode(false)
                    .HasColumnName("clave");

                entity.Property(e => e.Email)
                    .HasMaxLength(100)
                    .IsUnicode(false)
                    .HasColumnName("email");

                entity.Property(e => e.IdUsuario)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("id_usuario");

                entity.Property(e => e.Nombre)
                    .IsUnicode(false)
                    .HasColumnName("nombre");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
