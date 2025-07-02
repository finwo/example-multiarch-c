lc = $(subst A,a,$(subst B,b,$(subst C,c,$(subst D,d,$(subst E,e,$(subst F,f,$(subst G,g,$(subst H,h,$(subst I,i,$(subst J,j,$(subst K,k,$(subst L,l,$(subst M,m,$(subst N,n,$(subst O,o,$(subst P,p,$(subst Q,q,$(subst R,r,$(subst S,s,$(subst T,t,$(subst U,u,$(subst V,v,$(subst W,w,$(subst X,x,$(subst Y,y,$(subst Z,z,$1))))))))))))))))))))))))))

UNAME_MACHINE=$(call lc,$(shell uname -m))
UNAME_SYSTEM=$(call lc,$(shell uname -s))

TARGET=${UNAME_SYSTEM}-${UNAME_MACHINE}

.PHONY: default
default: example-$(TARGET)

example-$(TARGET):
	rm -rf build/
	mkdir -p build/
	cp -r src build/
	bash -c "[ -d arch/${TARGET} ] && cp -r --remove-destination arch/${TARGET}/* build/ || echo -n"
	(cd build/ && ${MAKE})
	mv build/example $@

.PHONY: clean
clean:
	rm -rf build
