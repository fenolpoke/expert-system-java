(deftemplate motherboard
	"template for motherboard"
    (slot number)
	(slot type)
	(slot price)
	(slot manufacturer)
	(slot index)
)
(deftemplate processor
	"template for processor"
    (slot number)
	(slot type)
	(slot price)
	(slot core)
	(slot index)
)

(deffacts motherboard-fact
	"list of motherboard facts"
    (motherboard (number 7) (type "ECS G41T-M12") (price 417000) (manufacturer "intel"))
    (motherboard (number 6) (type "ASROCK H55M-LE") (price 674500) (manufacturer "intel"))
    (motherboard (number 5) (type "ZOTAC nForce 6100") (price 405000) (manufacturer "AMD"))
    (motherboard (number 4) (type "EVGA X58 SLI3") (price 2213000) (manufacturer "intel"))
    (motherboard (number 3) (type "EVGA H55 MICRO ATX") (price 923000) (manufacturer "intel"))
    (motherboard (number 2) (type "GIGABYTE G1 ASSASSIN") (price 3400000) (manufacturer "intel"))
    (motherboard (number 1) (type "VVIKOO VA 890GX PRO") (price 997000) (manufacturer "AMD"))
)

(deffacts processor-fact
	"list of processor facts"
    (processor (number 7) (type "Intel Core I3 550Ghz") (price 1200000) (core "i3"))
    (processor (number 6) (type "AMD SEMPRON 2600") (price 600000) (core "i3"))
    (processor (number 5) (type "INTEL CORE i3 530") (price 900000) (core "i3"))
    (processor (number 4) (type "INTEL CORE 2380P") (price 1200000) (core "quad core"))
    (processor (number 3) (type "INTEL G530") (price 600000) (core "dual core"))
    (processor (number 2) (type "INTEL CORE i7-3820") (price 650000) (core "i3"))
    (processor (number 1) (type "INTEL I5-650") (price 5500000) (core "i3"))
)

(defrule addMotherboardIndex
	"add index"
    ?index <- (motherboard)
	=> (modify ?index (index ?index)))

(defrule addProcessorIndex
	"add index"
    ?index <- (processor)
	=> (modify ?index (index ?index)))
(reset)
(run)
(defglobal ?*size* = 15 ?*motherboard-size* = 7 ?*processor-size* = 7)

(deffunction cls() (for (bind ?i 0) (< ?i 20) (++ ?i) (printout t crlf)))

(deffunction viewComponents (?view)
    (bind ?number "jess")
    (while (eq (stringp ?number) TRUE)
	    (cls)
        (printout t "Item type to be " ?view "?" crlf)
        (printout t "1. Motherboard" crlf)
        (printout t "2. Processor" crlf)        
        (printout t "Choice: ")
        (bind ?number (readline))
        
        (	if(eq ?number "1") then
            
			    ;motherboard
			    
			    (printout t "MOTHERBOARD" crlf)
			    (printout t "=======================================" crlf)        
			    (printout t "No.   | Type                 | Price           | Manufacturer   | " crlf)
			    (printout t "=======================================" crlf)        
			        
			    (for(bind ?i ?*size*)(> ?i 0)(-- ?i)
				    (	try 
			/*            	(format t "%-5d. | %-20s | %-15s | %-15s |"
			                ((fact-slot-value ?i number)
			                (fact-slot-value ?i type)  
			                (fact-slot-value ?i price)  
			                (fact-slot-value ?i manufacturer)) *)
			*/
			            (printout t (fact-slot-value ?i number) " | "
			                (fact-slot-value ?i type)   " | "
			                (fact-slot-value ?i price)   " | "
			                (fact-slot-value ?i manufacturer) crlf)
			            
			   	     	catch
			            	(printout t "")
				    )
	    		)
	   			(printout t "=======================================" crlf)
            	(bind ?number 1)  
	   		elif (eq ?number "2") then
            
            	
			    ;processor
			    
			    (printout t "PROCESSOR" crlf)
			    (printout t "=======================================" crlf)        
			    (printout t "No.   | Type                 | Price           | Core           | " crlf)
			    (printout t "=======================================" crlf)        
			        
			    (for(bind ?i ?*size*)(> ?i 0)(-- ?i)
				    (	try 
			/*            	(format t "%-5d. | %-20s | %-15s | %-15s |"
			                ((fact-slot-value ?i number)
			                (fact-slot-value ?i type)  
			                (fact-slot-value ?i price)  
			                (fact-slot-value ?i manufacturer)) *)
			*/
			            (printout t (fact-slot-value ?i number) " | "
			                (fact-slot-value ?i type)   " | "
			                (fact-slot-value ?i price)   " | "
			                (fact-slot-value ?i core) crlf)
			            
			   	     	catch
			            	(printout t "")
				    )
	    		)
	   			(printout t "=======================================" crlf)     
            	(bind ?number 2)     
	        else
	        	(bind ?number "jess")
            
		)
	)    
     
     (return ?number)

)

(deffunction addComponent ()

    (bind ?number "jess")
    (while (eq (stringp ?number) TRUE)
        (cls)
        (printout t "Item type to be added?" crlf)
        (printout t "1. Motherboard" crlf)
        (printout t "2. Processor" crlf)        
        (printout t "Choice: ")
        (bind ?number (readline))
        (cls)
        (	if(eq ?number "1") then
            	(bind ?type "jess")            
              	(printout t "Guide : Motherboard type must be between 5 and 30 characters" crlf)            
               	(while (or (< (str-length ?type) 5) (> (str-length ?type) 30))                
                	(printout t "Motherboard type: ")
                	(bind ?type (readline))                	                
                )
			    
            	(bind ?price 0)
              	(printout t "Guide : Motherboard price must be between 10000 and 20000000 Rupiahs" crlf)               	

               	(while (or (< ?price 10000) (> ?price 20000000))
                	(	try                    		
		                	(printout t "Motherboard price: ")
		                	(bind ?price (read))  
                    		(< ?price 0)   
                    	catch
                    		(bind ?price 0)
                    		continue
                    )     	                
                )
            
            	
            	(bind ?manufacturer 0)
              	(printout t "Guide : Motherboard manufacturer must intel or AMD" crlf)
               	(while (and (neq ?manufacturer "intel") (neq ?manufacturer "AMD"))
                
                	(printout t "Motherboard manufacturer: ")
                	(bind ?manufacturer (readline))
                
                )
            	(++ ?*size*)
            	(++ ?*motherboard-size*)
            	(assert (motherboard (index ?*size*)(number ?*motherboard-size*) (type ?type) (price ?price) (manufacturer ?manufacturer)))
            
            	(printout t "Succesfully added" crlf)
            	(bind ?number 0)
            
	   		elif (eq ?number "2") then
            
            	
            	(bind ?type "jess")            
              	(printout t "Guide : Processor type must be between 5 and 30 characters" crlf)            
               	(while (or (< (str-length ?type) 5) (> (str-length ?type) 30))                
                	(printout t "Processor type: ")
                	(bind ?type (readline))                	                
                )
			    
            	(bind ?price 0)
              	(printout t "Guide : Processor price must be between 10000 and 20000000 Rupiahs" crlf)
               	(while (or (< ?price 10000) (> ?price 20000000))
                
                	(
                    	try
                    	
		                	(printout t "Processor price: ")
		                	(bind ?price (read))
		                	(< ?price 0)
                    	catch
                    		(bind ?price 0)
                    		continue
                    )
                
                )
            
            	
            	(bind ?core 0)
              	(printout t "Guide : Processor core must dual core or quad core or i3 or i5 or i7" crlf)
               	(while (and (and (and (and (neq ?core "dual core") (neq ?core "quad core")) (neq ?core "i3")) (neq ?core "i5")) (neq ?core "i7"))
                
                	(printout t "Processor core: ")
                	(bind ?core (readline))
                
                )
            	(++ ?*size*)
            	(++ ?*processor-size*)
            	(assert (processor (index ?*size*) (number ?*processor-size*) (type ?type) (price ?price) (core ?core)))
            
            	(printout t "Succesfully added" crlf)
            	(bind ?number 0)
            	
	        else
	        	(bind ?number "jess")
            
		)
	)
    
)

(deffunction updateComponent ()

    (bind ?number (viewComponents "updated"))
    
    (bind ?index "jess")
    (while (eq ?index "jess")
        (try
	        (printout t "Item number to be updated : ")
	        (bind ?index (read))
            (< ?index 0)
            (if(eq ?number 1) then
                (	try 

						(for(bind ?i 1)(< ?i ?*size*)(++ ?i)
							(if (eq (fact-slot-value ?i number) ?index) then 
								(fact-slot-value ?i manufacturer)																
								(bind ?index (fact-slot-value ?i index))
								break
							)							
						)
                    	(bind ?type "jess")            
		              	(printout t "Guide : Motherboard type must be between 5 and 30 characters" crlf)            
		               	(while (or (< (str-length ?type) 5) (> (str-length ?type) 30))                
		                	(printout t "Motherboard type: ")
		                	(bind ?type (readline))                	                
		                )
					    
		            	(bind ?price 0)
		              	(printout t "Guide : Motherboard price must be between 10000 and 20000000 Rupiahs" crlf)
		               	(while (or (< ?price 10000) (> ?price 20000000))
		                	(try
			                	(printout t "Motherboard price: ")
			                	(bind ?price (read))                	
                            	(< ?price 0)
							catch
                            	(bind ?price 0)
                            	continue
                            )
		                
		                )
		            
		            	
		            	(bind ?manufacturer 0)
		              	(printout t "Guide : Motherboard manufacturer must intel or AMD" crlf)
		               	(while (and (neq ?manufacturer "intel") (neq ?manufacturer "AMD"))
		                
		                	(printout t "Motherboard manufacturer: ")
		                	(bind ?manufacturer (readline))
		                
		                )
		            	(modify ?index  (type ?type) (price ?price) (manufacturer ?manufacturer))
		            
		            	(printout t "Succesfully updated" crlf)
                    	(bind ?index 0)
                    catch
                    	(bind ?number "jess")
                    	continue
				)
                
                elif (eq ?number 2) then
                	(	try
	                    	(for(bind ?i 1)(< ?i ?*size*)(++ ?i)
								(if (eq (fact-slot-value ?i number) ?index) then 
									(fact-slot-value ?i core)																
									(bind ?index (fact-slot-value ?i index))
									break
								)							
							)
                    		
			            	
			            	(bind ?type "jess")            
			              	(printout t "Guide : Processor type must be between 5 and 30 characters" crlf)            
			               	(while (or (< (str-length ?type) 5) (> (str-length ?type) 30))                
			                	(printout t "Processor type: ")
			                	(bind ?type (readline))                	                
			                )
						    
			            	(bind ?price 0)
			              	(printout t "Guide : Processor price must be between 10000 and 20000000 Rupiahs" crlf)
			               	(while (or (< ?price 10000) (> ?price 20000000))
			                	(try
				                	(printout t "Processor price: ")
				                	(bind ?price (read))       
                            		(< ?price 0)         	
                            	catch
                            		(bind ?price 0)
                            		continue
                            	)
			                
			                )
			            
			            	
			            	(bind ?core 0)
			              	(printout t "Guide : Processor core must dual core or quad core or i3 or i5 or i7" crlf)
			               	(while (and (and (and (and (neq ?core "dual core") (neq ?core "quad core")) (neq ?core "i3")) (neq ?core "i5")) (neq ?core "i7"))
			                
			                	(printout t "Processor core: ")
			                	(bind ?core (readline))
			                
			                )
			            	(modify  ?index (type ?type) (price ?price) (core ?core))
			            
			            	(printout t "Succesfully updated" crlf)
                    		(bind ?index 0)
                    	catch
                    	(bind ?number "jess")
                    		continue
                    )
                else
                	(bind ?index "jess")
			)
            
    	catch
            (bind ?index "jess")
            continue
		)
	)
    (readline)
    
)

(deffunction deleteComponent ()

	(bind ?number (viewComponents "deleted"))
    
    (bind ?index "jess")
    (while(eq ?index "jess")
        (try
	        (printout t "Item number to be deleted : ")
	        (bind ?index (read))
			(< ?index 0)
            (if(eq ?number 1) then
                (	try 

						(for(bind ?i 1)(< ?i ?*size*)(++ ?i)
							(if (eq (fact-slot-value ?i number) ?index) then 
								(fact-slot-value ?i manufacturer)																
								(bind ?index (fact-slot-value ?i index))
								break
							)							
						)
						;remove
		            	(remove ?index)
		            
		            	(printout t "Succesfully deleted" crlf)
                    	(bind ?index 0)
                    catch
                    	continue
				)
                
                elif (eq ?number 2) then
                	(	try
	                    	(for(bind ?i 1)(< ?i ?*size*)(++ ?i)
								(if (eq (fact-slot-value ?i number) ?index) then 
									(fact-slot-value ?i core)																
									(bind ?index (fact-slot-value ?i index))
									break
								)							
							)
                    		;remove
			            	(remove  ?index )
			            
			            	(printout t "Succesfully deleted" crlf)
                    		(bind ?index 0)
                    	catch
                    		continue
                    )
                else
                	(bind ?index "jess")
			)
            
		
		)
	)
    (readline)
    
    
)

(deffunction simulationComputerAssembly ()

    (bind ?budget 0)
    (while (or (< ?budget 400000) (> ?budget 2000000))
    	(printout t "Budget: ")
    	(bind ?budget (read))
    	(if (eq (numberp ?budget) FALSE) then continue)
    )
    
	(bind ?manufacturer 0)
  	(printout t "Guide : Motherboard manufacturer must intel or AMD" crlf)
   	(while (and (neq ?manufacturer "intel") (neq ?manufacturer "AMD"))
    
    	(printout t "Motherboard manufacturer: ")
    	(bind ?manufacturer (readline))
    
    )
			            	
	(bind ?core 0)
  	(printout t "Guide : Processor core must dual core or quad core or i3 or i5 or i7" crlf)
   	(while (and (and (and (and (neq ?core "dual core") (neq ?core "quad core")) (neq ?core "i3")) (neq ?core "i5")) (neq ?core "i7"))
    
    	(printout t "Processor core: ")
    	(bind ?core (readline))
    
    )
)

(bind ?answer "jess")

(while (eq (stringp ?answer) TRUE)

    (cls)
    (printout  t "Bluejack Assemblies" crlf)
    (printout  t "1. View Components" crlf)
    (printout  t "2. Add Component" crlf)
    (printout  t "3. Update Component" crlf)
    (printout  t "4. Delete Component" crlf)
    (printout  t "5. Simulation Computer Assembly" crlf)
    (printout  t "6. Exit" crlf)
    
    (printout  t "Choice : ")
    (bind ?answer (readline))    
    
    (	if (eq ?answer "1") then
        	(viewComponents "viewed")
        	(readline)
        elif (eq ?answer "2") then
        	(addComponent)
        elif (eq ?answer "3") then
        	(updateComponent)
        elif (eq ?answer "4") then
        	(deleteComponent)
        elif (eq ?answer "5") then
        	(simulationComputerAssembly)
        elif (eq ?answer "6") then
        	(printout t "Thank you")
        	(readline)
        	(bind ?answer 0)
        else
        	(bind ?answer "jess")
     )
)