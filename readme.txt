
�Enginx�̃C���X�g�[��

�Ephp-fpm�̃C���X�g�[��

�Enginx��php-fpm�̘A�g
 list
  6-9 nginx�̃e���v���[�g�t�@�C��
  6-10 recipe�Ƀe���v���[�g��ǂݍ��ސݒ��ǉ�
  6-11 Attribute���g�p����php�Ɋւ���ݒ�t�@�C����ǂݍ��ނ��ǂ����̐�������Ă���
  6-12 nginx��php�Ɋւ���ݒ��L���ɂ��邽�߂�Vagrantfile���C��

�EOPcahe�̓���
 list
  6-13 php��package���\�[�X�̔z���php-pecl-zendopcache��ǉ�����
  
�Ephp55�𓱓�
 list
  6-16 ����ł̓��\�[�Xyum_repository�ɂ��Ayum��remi��L���ɂ��Ă��邪�Ayum_repository�����삵�Ȃ������̂ŁA�z���php��php55�ɕύX���đΏ�����(php55.rb)

�Eruby���̍\�z
 list
  6-18
  6-23 rbenv + ruby-build + ruby�ݽİ� 

�@�@���Ō��ruby�C���X�g�[������http_proxy�̒�`���K�v�Ȉׂ�recipe(env-proxy)��ǉ��B
�@�@�@attributes
      /////////////////////////////////////////////////////////////////////////
       default["env-proxy"]["proxy"] = "http://proxy2.xxxxxcom.co.jp:8080"
      /////////////////////////////////////////////////////////////////////////
      recipes/default.rb �ȉ���execute�̒��O�ɒǋL�B
      /////////////////////////////////////////////////////////////////////////
      proxy = node['env-proxy']['proxy']
 
      bash "proxy on profile" do
        not_if { proxy.empty? }
        code <<-EOC
        echo "export http_proxy=#{proxy}" >> /etc/profile
        echo "export https_proxy=#{proxy}" >> /etc/profile
        source /etc/profile
       EOC
      end
      /////////////////////////////////////////////////////////////////////////


�EUnicorn�̒ǉ�
 list
  6-24 ruby-env/recipes/default.erb�ɒǋL
  6-25 Unicorn��nginx���g����悤�ɂ��邽�߂�nginx.conf�p�̃e���v���[�g�ҏW
  
P165�̍Ō�Agem install rails -V �܂Ŏ��s�@�����Ԃ�20�����炢���������Bvagrant halt���Ă����B
