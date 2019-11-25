#!/bin/bash
read -p "What Domain will you be working with (a/b/e/v)?
(Archaea = a, Bacteria = b, Eukarya = e, Viral = v)  " choice
if [ "$choice" == $choice ] ; then
	if [ "$choice" == "a" ] ; then
		tput setaf 2 ; echo "Archaea" ; tput sgr 0
		read -p "Use cobalt_2 to add assembly summaries? (y/n)  " choice2
			if [ "$choice2" == "y" ] ; then
				source ~/cobalt_2/sub_scripts_dir/cobalt_2.2_a.sh
			elif [ "$choice2" == "n" ] ; then
				source ~/cobalt_2/sub_scripts_dir/cobalt_2.2_alt.sh
			fi
	elif [ "$choice" == "b" ] ; then
		tput setaf 2 ; echo "Bacteria" ; tput sgr 0
		read -p "Use cobalt_2 to add assembly summaries? (y/n)  " choice2
			if [ "$choice2" == "y" ] ; then
				source ~/cobalt_2/sub_scripts_dir/cobalt_2.2_b.sh
			elif [ "$choice2" == "n" ] ; then
				source ~/cobalt_2/sub_scripts_dir/cobalt_2.2_alt.sh
			fi
	elif [ "$choice" == "e" ] ; then
		tput setaf 2 ; echo "Eukarya" ; tput sgr 0
		read -p "Use cobalt_2 to add assembly summaries? (y/n)  " choice2
			if [ "$choice2" == "y" ] ; then
				read -p "What Eukaryotic classification? (f/i/p/pr/vm/vo)
(Fungi = f, Invertebrate = i, Plant = p)
(Protozoa = pr, Vertebrate_Mammal = vm)
(Vertebrate_other = vo)                  " choice3
				if [ "$choice3" == "f" ] ; then
					tput setaf 2 ; echo "Fungi" ; tput sgr 0
					source ~/cobalt_2/sub_scripts_dir/cobalt_2.2_f.sh
				elif [ "$choice3" == "i" ] ; then
					tput setaf 2 ; echo "Invertebrate" ; tput sgr 0
					source ~/cobalt_2/sub_scripts_dir/cobalt_2.2_i.sh
				elif [ "$choice3" == "p" ] ; then
					tput setaf 2 ; echo "Plant" ; tput sgr 0
					source ~/cobalt_2/sub_scripts_dir/cobalt_2.2_p.sh
				elif [ "$choice3" == "pr" ] ; then
					tput setaf 2 ; echo "Protozoa" ; tput sgr 0
					source ~/cobalt_2/sub_scripts_dir/cobalt_2.2_pr.sh
				elif [ "$choice3" == "vm" ] ; then
					tput setaf 2 ; echo "Vertebrate_Mammal" ; tput sgr 0
					source ~/cobalt_2/sub_scripts_dir/cobalt_2.2_vm.sh
				elif [ "$choice3" == "vo" ] ; then
					tput setaf 2 ; echo "Vertebrate_other" ; tput sgr 0
					source ~/cobalt_2/sub_scripts_dir/cobalt_2.2_vo.sh
				fi
			elif [ "$choice2" == "n" ] ; then
					source ~/cobalt_2/sub_scripts_dir/cobalt_2.2_alt.sh
			fi
	elif [ "$choice" == "v" ] ; then
		tput setaf 2 ; echo "Viral" ; tput sgr 0
		read -p "Use cobalt_2 to add assembly summaries? (y/n)  " choice2
			if [ "$choice2" == "y" ] ; then
				source ~/cobalt_2/sub_scripts_dir/cobalt_2.2_v.sh
			elif [ "$choice2" == "n" ] ; then
				source ~/cobalt_2/sub_scripts_dir/cobalt_2.2_alt.sh
			fi
	fi
fi
