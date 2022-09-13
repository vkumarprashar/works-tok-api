using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using WebApplication2.Models;

namespace WebApplication2
{
    public partial class worksTokV2Context : DbContext
    {
        public worksTokV2Context()
        {
        }

        public worksTokV2Context(DbContextOptions<worksTokV2Context> options)
            : base(options)
        {
        }

        public virtual DbSet<Client> Clients { get; set; } = null!;
        public virtual DbSet<Company> Companies { get; set; } = null!;
        public virtual DbSet<Employee> Employees { get; set; } = null!;
        public virtual DbSet<HolidayDay> HolidayDays { get; set; } = null!;
        public virtual DbSet<Profession> Professions { get; set; } = null!;
        public virtual DbSet<Schedule> Schedules { get; set; } = null!;
        public virtual DbSet<VacationDay> VacationDays { get; set; } = null!;
        public virtual DbSet<Withdrawal> Withdrawals { get; set; } = null!;
        public virtual DbSet<WorkRequest> WorkRequests { get; set; } = null!;
        public virtual DbSet<WorkType> WorkTypes { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder
                    .UseLazyLoadingProxies()
                    .UseSqlServer("server=.;Database=worksTokV2;Trusted_Connection=true;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Client>(entity =>
            {
                entity.ToTable("Client");

                entity.Property(e => e.Name)
                    .HasMaxLength(100)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Company>(entity =>
            {
                entity.ToTable("Company");

                entity.Property(e => e.Address)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.CompanyCommissionRate).HasDefaultValueSql("((5))");

                entity.Property(e => e.Itn)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("ITN");

                entity.Property(e => e.Name)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.PhoneNumber)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.SystemCommissionRate).HasDefaultValueSql("((2.5))");
            });

            modelBuilder.Entity<Employee>(entity =>
            {
                entity.ToTable("Employee");

                entity.Property(e => e.Comment).IsUnicode(false);

                entity.Property(e => e.DateOfBirth)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.FirstName)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.LastName)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.MiddleName)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.PhoneNumber)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.Employees)
                    .HasForeignKey(d => d.CompanyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Employee_Company1");

                entity.HasMany(d => d.Professions)
                    .WithMany(p => p.Employees)
                    .UsingEntity<Dictionary<string, object>>(
                        "ProfessionOfEmployee",
                        l => l.HasOne<Profession>().WithMany().HasForeignKey("ProfessionId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("fk_Employee_has_Profession_Profession1"),
                        r => r.HasOne<Employee>().WithMany().HasForeignKey("EmployeeId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("fk_Employee_has_Profession_Employee1"),
                        j =>
                        {
                            j.HasKey("EmployeeId", "ProfessionId").HasName("pk_ProfessionOfEmployee");

                            j.ToTable("ProfessionOfEmployee");
                        });
            });

            modelBuilder.Entity<HolidayDay>(entity =>
            {
                entity.Property(e => e.Comment).IsUnicode(false);

                entity.Property(e => e.EndHolidayDate).HasColumnType("date");

                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.StartHolidayDate).HasColumnType("date");

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.HolidayDays)
                    .HasForeignKey(d => d.CompanyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_HolidayDays_Company1");
            });

            modelBuilder.Entity<Profession>(entity =>
            {
                entity.ToTable("Profession");

                entity.Property(e => e.Description).IsUnicode(false);

                entity.Property(e => e.Name)
                    .HasMaxLength(100)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Schedule>(entity =>
            {
                entity.ToTable("Schedule");

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.Schedules)
                    .HasForeignKey(d => d.EmployeeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Schedule_Employee1");
            });

            modelBuilder.Entity<VacationDay>(entity =>
            {
                entity.Property(e => e.Comment).IsUnicode(false);

                entity.Property(e => e.EndVacationDate).HasColumnType("date");

                entity.Property(e => e.StartVacationDate).HasColumnType("date");

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.VacationDays)
                    .HasForeignKey(d => d.EmployeeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_VacationDays_Employee1");
            });

            modelBuilder.Entity<Withdrawal>(entity =>
            {
                entity.Property(e => e.Amount).HasColumnType("decimal(10, 2)");

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.Withdrawals)
                    .HasForeignKey(d => d.EmployeeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Withdrawals_Employee1");
            });

            modelBuilder.Entity<WorkRequest>(entity =>
            {
                entity.ToTable("WorkRequest");

                entity.Property(e => e.Address)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.TaskDescription)
                    .HasMaxLength(300)
                    .IsUnicode(false);

                entity.HasOne(d => d.Client)
                    .WithMany(p => p.WorkRequests)
                    .HasForeignKey(d => d.ClientId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_BuildingRequest_Client1");

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.WorkRequests)
                    .HasForeignKey(d => d.EmployeeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_BuildingRequest_Employee1");

                entity.HasOne(d => d.Withdrawals)
                    .WithMany(p => p.WorkRequests)
                    .HasForeignKey(d => d.WithdrawalsId)
                    .HasConstraintName("fk_WorkRequest_Withdrawals1");

                entity.HasOne(d => d.WorkType)
                    .WithMany(p => p.WorkRequests)
                    .HasForeignKey(d => d.WorkTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_BuildingRequest_WorkType1");
            });

            modelBuilder.Entity<WorkType>(entity =>
            {
                entity.ToTable("WorkType");

                entity.Property(e => e.Description).IsUnicode(false);

                entity.Property(e => e.Name)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.HasMany(d => d.Employees)
                    .WithMany(p => p.WorkTypes)
                    .UsingEntity<Dictionary<string, object>>(
                        "WorkTypeOfEmployee",
                        l => l.HasOne<Employee>().WithMany().HasForeignKey("EmployeeId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("fk_Employee_has_WorkType_Employee"),
                        r => r.HasOne<WorkType>().WithMany().HasForeignKey("WorkTypeId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("fk_Employee_has_WorkType_WorkType1"),
                        j =>
                        {
                            j.HasKey("WorkTypeId", "EmployeeId").HasName("pk_WorkTypeOfEmployee");

                            j.ToTable("WorkTypeOfEmployee");
                        });

                entity.HasMany(d => d.Professions)
                    .WithMany(p => p.WorkTypes)
                    .UsingEntity<Dictionary<string, object>>(
                        "WorkTypeOfProfession",
                        l => l.HasOne<Profession>().WithMany().HasForeignKey("ProfessionId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("fk_WorkType_has_Profession_Profession1"),
                        r => r.HasOne<WorkType>().WithMany().HasForeignKey("WorkTypeId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("fk_WorkType_has_Profession_WorkType1"),
                        j =>
                        {
                            j.HasKey("WorkTypeId", "ProfessionId").HasName("pk_WorkTypeOfProfession");

                            j.ToTable("WorkTypeOfProfession");
                        });
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
