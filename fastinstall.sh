
getpackage()
{
  spwd=$PWD
  echo $1
  if [ -d $1 ]; then 
    cd $1
    git pull
    cd $spwd    
  else
    echo "Missing package"
    echo $2
    git clone $2 $3
  fi
}

pinstall()
{
  spwd=$PWD
  echo "Installing $1"
  if [ -d $1 ]; then 
    cd $1
    python setup.py develop
    cd $spwd    
  else
    echo "Couldn't find package"
  fi
}


getpackage . git://github.com/AndreaCensi/boot12env.git

cd src
getpackage latex_gen git://github.com/AndreaCensi/latex_gen.git
getpackage contracts git://github.com/AndreaCensi/contracts.git
getpackage compmake git://github.com/AndreaCensi/compmake.git
getpackage geometry git://github.com/AndreaCensi/geometry.git
getpackage procgraph git://github.com/AndreaCensi/procgraph.git
getpackage reprep git://github.com/AndreaCensi/reprep.git
getpackage conf_tools git://github.com/AndreaCensi/conf_tools.git
getpackage boot_olympics git://github.com/AndreaCensi/boot_olympics.git
getpackage bvapps git://github.com/AndreaCensi/bvapps.git
getpackage vehicles git://github.com/AndreaCensi/vehicles.git
getpackage boot_agents git://github.com/AndreaCensi/boot_agents.git
getpackage utils git://github.com/AndreaCensi/utils.git
getpackage surf12adam git://github.com/AndreaCensi/surf12adam.git suft12adam_wiki
getpackage boot_olympics.wiki git://github.com/AndreaCensi/boot_olympics.wiki.git
getpackage surf12adam.wiki git://github.com/AndreaCensi/surf12adam.wiki.git
getpackage quickapp git://github.com/AndreaCensi/quickapp.git
cd ..
echo "Done getting packages"

python setup develop
cd src
pinstall latex_gen
pinstall contracts
pinstall compmake
pinstall geometry
pinstall procgraph
pinstall reprep
pinstall conf_tools
pinstall boot_olympics
pinstall bvapps
pinstall vehicles
pinstall boot_agents
pinstall utils
pinstall surf12adam
pinstall boot_olympics.wiki
pinstall surf12adam.wiki
pinstall quickapp