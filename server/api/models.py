# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class TblAdmin(models.Model):
    id_admin = models.AutoField(primary_key=True)
    username = models.CharField(max_length=100)
    password = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'tbl_admin'


class TblGaji(models.Model):
    id_gaji = models.AutoField(primary_key=True)
    gaji_kotor = models.IntegerField()
    jumlah_lembur = models.IntegerField()
    pajak = models.IntegerField()
    total_tunjangan = models.IntegerField()
    gaji_bersih = models.IntegerField()
    bulan = models.CharField(max_length=100)
    tahun = models.IntegerField()
    id_karyawan = models.ForeignKey('TblKaryawan', models.DO_NOTHING, db_column='id_karyawan')

    class Meta:
        managed = False
        db_table = 'tbl_gaji'

    def get_gaji_data(self):
        data = {"id": str(self.id_gaji), "bersih": str(self.gaji_bersih), "tahun": str(self.tahun), "bulan": str(self.bulan), "kotor": str(self.gaji_kotor), "lembur": str(self.jumlah_lembur), "tunjangan": str(self.total_tunjangan)}
        
        return data


         

class TblJabatan(models.Model):
    id_jabatan = models.AutoField(primary_key=True)
    nama_jabatan = models.CharField(max_length=100)
    jumlah_gaji_pokok = models.IntegerField()
    upah_lembur = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'tbl_jabatan'


class TblKaryawan(models.Model):
    id_karyawan = models.AutoField(primary_key=True)
    nama_karyawan = models.CharField(max_length=100)
    alamat = models.TextField()
    no_hp = models.IntegerField()
    tempat_lahir = models.CharField(max_length=100)
    tanggal_lahir = models.DateField()
    jenis_kelamin = models.CharField(max_length=100)
    status = models.CharField(max_length=100)
    jumlah_anak = models.IntegerField()
    username = models.CharField(max_length=100)
    password = models.CharField(max_length=100)
    id_jabatan = models.ForeignKey(TblJabatan, models.DO_NOTHING, db_column='id_jabatan')
    def get_employee_data(self):
        return {"name": self.nama_karyawan, "others": """Alamat: {}\nNo HP: {}\nJumlah Anak: {}""".format(self.alamat, self.no_hp, self.jumlah_anak)}
    class Meta:
        managed = False
        db_table = 'tbl_karyawan'
